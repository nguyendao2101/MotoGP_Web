// ignore_for_file: invalid_use_of_protected_member, avoid_print, use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common_widget/rider_detail.dart';
import '../../view_model/riders_and_teams_view_models.dart';

class SliverListResultsMotoGPWUP extends StatelessWidget {
  final RidersAndTeamsViewModels controller;
  final RxList<Map<String, dynamic>> listDS; // Sử dụng RxList từ controller

  const SliverListResultsMotoGPWUP(
      {super.key, required this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final resultsList = listDS.value;

      if (resultsList.isEmpty) {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        sortResultsByTime(resultsList);

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var result = resultsList[index];
                var riderDetails =
                    result['RiderDetails']; // Lấy thông tin tay đua

                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 2),
                      child: Container(
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white, // Màu nền của Container
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '#${index + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 32),
                              ),
                              Text(
                                result['Time'],
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 130,
                      child: Image.network(
                        riderDetails['ImageRacer'],
                        height: 90,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 380,
                      child: Text(
                        controller.extractNumbers(result['Id']),
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 480,
                      child: InkWell(
                        onTap: () {
                          Get.to(RiderDetailScreen(
                            rider: riderDetails,
                          ));
                        },
                        child: Text(
                          riderDetails['Name'],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 780,
                      child: Image.network(
                        riderDetails['ImageCountry'],
                        height: 20,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 840,
                      child: Text(
                        riderDetails['Team'],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                      top: 45,
                      left: 1540,
                      child: Text(
                        result['Gap'],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                      top: 45,
                      left: 1350,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 30,
                            ),
                            onPressed: () {
                              // Hiển thị dialog chỉnh sửa
                              _showEditDialog(
                                  context, resultsList[index], index);
                            },
                          ),
                          const SizedBox(width: 4),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () async {
                              try {
                                // Lấy ID của tài liệu từ dữ liệu của calendar
                                String documentId = resultsList[index]['id'];

                                // Lấy dữ liệu từ Calendar/GrandsPrix
                                final snapshot = await FirebaseDatabase.instance
                                    .ref(
                                        'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/MotoGP')
                                    .get();

                                if (snapshot.exists) {
                                  // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                                  for (var grandPrixEntry
                                      in snapshot.children) {
                                    // Kiểm tra xem documentId có tồn tại trong nhánh này không
                                    final addCalendarSnapshot =
                                        grandPrixEntry.child(documentId);
                                    if (addCalendarSnapshot.exists) {
                                      // Nếu tồn tại, thực hiện xóa
                                      await FirebaseDatabase.instance
                                          .ref(
                                              'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/MotoGP/${grandPrixEntry.key}/$documentId')
                                          .remove();

                                      // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                      listDS.removeAt(index);

                                      // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                      return;
                                    }
                                  }
                                }

                                // Nếu không tìm thấy documentId, in ra thông báo lỗi
                                print(
                                    'Không tìm thấy documentId trong các nhánh con.');
                              } catch (e) {
                                // Xử lý lỗi nếu có vấn đề xảy ra
                                print(
                                    'Lỗi khi xóa dữ liệu từ Realtime Database: $e');
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount:
                  resultsList.length, // Số lượng phần tử trong danh sách
            ),
          ),
        );
      }
    });
  }

  void sortResultsByTime(List<Map<String, dynamic>> resultsList) {
    // Hàm chuyển đổi chuỗi thời gian thành giây
    double convertTimeToSeconds(String time) {
      // Tách thời gian ra theo phút, giây và mili giây
      List<String> parts = time.split(':');
      int minutes = int.parse(parts[0]);
      List<String> secondsParts = parts[1].split('.');
      int seconds = int.parse(secondsParts[0]);
      int milliseconds = int.parse(secondsParts[1]);

      // Tính tổng số giây
      return minutes * 60 + seconds + milliseconds / 1000;
    }

    // Sắp xếp danh sách dựa trên giá trị thời gian đã chuyển đổi
    resultsList.sort((a, b) {
      double timeA = convertTimeToSeconds(a['Time']);
      double timeB = convertTimeToSeconds(b['Time']);
      return timeA.compareTo(timeB); // Sắp xếp tăng dần
    });
  }

  void _showEditDialog(
      BuildContext context, Map<String, dynamic> calendar, int index) {
    final TextEditingController idController =
        TextEditingController(text: calendar['Id'].toString());
    final TextEditingController gapController =
        TextEditingController(text: calendar['Gap'].toString());
    final TextEditingController timeController =
        TextEditingController(text: calendar['Time'].toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Infomation'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'Id'),
                ),
                TextField(
                  controller: gapController,
                  decoration: const InputDecoration(labelText: 'Gap'),
                ),
                TextField(
                  controller: timeController,
                  decoration: const InputDecoration(labelText: 'Time'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog mà không làm gì
              },
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  String documentId = calendar['id'];

                  // Lấy dữ liệu từ Calendar/GrandsPrix
                  final snapshot = await FirebaseDatabase.instance
                      .ref(
                          'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/MotoGP')
                      .get();

                  if (snapshot.exists) {
                    // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                    for (var grandPrixEntry in snapshot.children) {
                      // Kiểm tra xem documentId có tồn tại trong nhánh này không
                      final addCalendarSnapshot =
                          grandPrixEntry.child(documentId);
                      if (addCalendarSnapshot.exists) {
                        // Nếu tồn tại, thực hiện cập nhật
                        await FirebaseDatabase.instance
                            .ref(
                                'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/MotoGP/${grandPrixEntry.key}/$documentId')
                            .update({
                          'Id': idController.text,
                          'Points': gapController.text,
                          'Time': timeController.text,
                        });

                        // Cập nhật lại danh sách trong ứng dụng
                        listDS[index] = {
                          ...calendar,
                          'Id': idController.text,
                          'Points': gapController.text,
                          'Time': timeController.text,
                        };

                        // Đóng dialog sau khi cập nhật thành công
                        Navigator.of(context).pop();
                        return;
                      }
                    }
                  }

                  // Nếu không tìm thấy, thông báo lỗi
                  print('Không tìm thấy documentId trong các nhánh con.');
                } catch (e) {
                  print('Lỗi khi cập nhật dữ liệu: $e');
                }
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }
}
