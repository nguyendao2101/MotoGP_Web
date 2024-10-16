// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common_widget/rider_detail.dart';

class ResultsAndStandingsStadingsListView extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final RxList<Map<String, dynamic>> listDS; // Sử dụng RxList từ controller
  const ResultsAndStandingsStadingsListView(
      {super.key, this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ignore: invalid_use_of_protected_member
      final resultsList = listDS.value;

      if (resultsList.isEmpty) {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        // Sắp xếp danh sách theo điểm số tăng dần
        // resultsList.sort((a, b) => b['Points'].compareTo(a['Points']));
        sortResultsByPoints(resultsList);

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
                          gradient: index == 0 //1
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF1E201E),
                                    Color(0xFF4F1787)
                                  ], // Các màu gradient
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : const LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white
                                  ], // Gradient mặc định nếu id không phải là 1
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: index == 0 //1 //2
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          // Hiển thị dialog chỉnh sửa
                                          _showEditDialog(context,
                                              resultsList[index], index);
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
                                            String documentId =
                                                resultsList[index]['id'];

                                            // Lấy dữ liệu từ Calendar/GrandsPrix
                                            final snapshot = await FirebaseDatabase
                                                .instance
                                                .ref(
                                                    'Results&Standings/Standings/2024/RidersChampionship')
                                                .get();

                                            if (snapshot.exists) {
                                              // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                                              for (var grandPrixEntry
                                                  in snapshot.children) {
                                                // Kiểm tra xem documentId có tồn tại trong nhánh này không
                                                final addCalendarSnapshot =
                                                    grandPrixEntry
                                                        .child(documentId);
                                                if (addCalendarSnapshot
                                                    .exists) {
                                                  // Nếu tồn tại, thực hiện xóa
                                                  await FirebaseDatabase
                                                      .instance
                                                      .ref(
                                                          'Results&Standings/Standings/2024/RidersChampionship/${grandPrixEntry.key}/$documentId')
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
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    result['Points'].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: index == 0 //1 //3
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 120,
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
                        style: TextStyle(
                            fontSize: 20,
                            color: index == 0 //1 //4
                                ? Colors.white
                                : Colors.grey,
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
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: index == 0 //1 //5
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 880,
                      child: Image.network(
                        riderDetails['ImageCountry'],
                        height: 20,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 940,
                      child: Text(
                        riderDetails['Team'],
                        style: TextStyle(
                          fontSize: 20,
                          color: index == 0 ? Colors.white : Colors.grey, //6
                        ),
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

  void _showEditDialog(
      BuildContext context, Map<String, dynamic> calendar, int index) {
    final TextEditingController idController =
        TextEditingController(text: calendar['Id'].toString());
    final TextEditingController pointsController =
        TextEditingController(text: calendar['Points'].toString());

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
                  controller: pointsController,
                  decoration: const InputDecoration(labelText: 'Points'),
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
                          'Results&Standings/Standings/2024/RidersChampionship')
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
                                'Results&Standings/Standings/2024/RidersChampionship/${grandPrixEntry.key}/$documentId')
                            .update({
                          'Id': idController.text,
                          'Points': pointsController.text,
                        });

                        // Cập nhật lại danh sách trong ứng dụng
                        listDS[index] = {
                          ...calendar,
                          'Id': idController.text,
                          'Points': pointsController.text,
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

  void sortResultsByPoints(List<Map<String, dynamic>> resultsList) {
    resultsList.sort((a, b) {
      // Lấy giá trị Points của a và b, nếu không có thì mặc định là 0
      int pointsA;
      int pointsB;

      // Kiểm tra kiểu dữ liệu của a['Points']
      if (a['Points'] is int) {
        pointsA = a['Points'];
      } else if (a['Points'] is String) {
        pointsA = int.tryParse(a['Points']) ?? 0;
      } else {
        pointsA = 0;
      }

      // Kiểm tra kiểu dữ liệu của b['Points']
      if (b['Points'] is int) {
        pointsB = b['Points'];
      } else if (b['Points'] is String) {
        pointsB = int.tryParse(b['Points']) ?? 0;
      } else {
        pointsB = 0;
      }

      // Sắp xếp theo thứ tự giảm dần
      return pointsB.compareTo(pointsA);
      // return pointsA.compareTo(pointsB);
    });
  }
}
