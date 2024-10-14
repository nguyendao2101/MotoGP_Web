// ignore_for_file: invalid_use_of_protected_member, avoid_print, use_build_context_synchronously

import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'riders_and_teams_teams_detail.dart';

class GridViewTeams extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final RxList<Map<String, dynamic>> listDS;
  const GridViewTeams({super.key, this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final resultsList = listDS.value;

      // Sử dụng danh sách ridersListMotoGP thay vì lấy trực tiếp từ controller
      if (resultsList.isEmpty) {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Số cột trong lưới
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8, // Tỉ lệ giữa chiều rộng và chiều cao
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var result = resultsList[index];
                var riderDetails = result[
                    'RiderDetails']; // Sử dụng ridersListMotoGP truyền vào
                return InkWell(
                  onTap: () {
                    Get.to(() => RidersAndTeamsTeamsDetail(
                          team: result,
                          teamsDetail: riderDetails,
                        ));
                  },
                  child: GridTile(
                    footer: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            result['Team'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                riderDetails['Name'],
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
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
                                      _showEditDialog(
                                          context, resultsList[index], index);
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
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
                                            .ref('Riders&Team/Teams/MotoGP')
                                            .get();

                                        if (snapshot.exists) {
                                          // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                                          // Nếu documentId tồn tại, thực hiện xóa
                                          await FirebaseDatabase.instance
                                              .ref(
                                                  'Riders&Team/Teams/MotoGP/$documentId')
                                              .remove();

                                          // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                          listDS.removeAt(index);

                                          // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                          return;
                                        }

                                        // Lấy dữ liệu từ Calendar/GrandsPrix
                                        final snapshot2 = await FirebaseDatabase
                                            .instance
                                            .ref('Riders&Team/Teams/Moto2')
                                            .get();

                                        if (snapshot2.exists) {
                                          // Duyệt qua từng nhánh con của Calendar/AllEvents
                                          // Nếu documentId tồn tại, thực hiện xóa
                                          await FirebaseDatabase.instance
                                              .ref(
                                                  'Riders&Team/Teams/Moto2/$documentId')
                                              .remove();

                                          // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                          listDS.removeAt(index);

                                          // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                          return;
                                        }

                                        // Lấy dữ liệu từ Calendar/GrandsPrix
                                        final snapshot3 = await FirebaseDatabase
                                            .instance
                                            .ref('Riders&Team/Teams/Moto3')
                                            .get();

                                        if (snapshot3.exists) {
                                          // Duyệt qua từng nhánh con của Calendar/AllEvents
                                          // Nếu documentId tồn tại, thực hiện xóa
                                          await FirebaseDatabase.instance
                                              .ref(
                                                  'Riders&Team/Teams/Moto3/$documentId')
                                              .remove();

                                          // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                          listDS.removeAt(index);

                                          // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                          return;
                                        }

                                        // Lấy dữ liệu từ Calendar/GrandsPrix
                                        final snapshot4 = await FirebaseDatabase
                                            .instance
                                            .ref('Riders&Team/Teams/MotoE')
                                            .get();

                                        if (snapshot4.exists) {
                                          // Nếu documentId tồn tại, thực hiện xóa
                                          await FirebaseDatabase.instance
                                              .ref(
                                                  'Riders&Team/Teams/MotoE/$documentId')
                                              .remove();

                                          // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                          listDS.removeAt(index);

                                          // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                          return;
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
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            riderDetails['TeamMateName'],
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                _randomColor(),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        result['Image'] != ''
                            ? Image.network(
                                result['Image'],
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.person,
                                size: 50, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              },
              childCount: listDS.length, // Số lượng phần tử trong danh sách
            ),
          ),
        );
      }
    });
  }

  Color _randomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void _showEditDialog(
      BuildContext context, Map<String, dynamic> riderInf, int index) {
    final TextEditingController bikeManufacturerController =
        TextEditingController(text: riderInf['BikeManufacturer'].toString()); //
    final TextEditingController idController =
        TextEditingController(text: riderInf['Id'].toString()); //
    final TextEditingController imageController =
        TextEditingController(text: riderInf['Image'].toString()); //
    final TextEditingController rider1RacerController =
        TextEditingController(text: riderInf['Rider1'].toString()); //
    //
    final TextEditingController rider2Controller =
        TextEditingController(text: riderInf['Rider2'].toString());

    final TextEditingController teamController =
        TextEditingController(text: riderInf['Team'].toString());

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
                  controller: bikeManufacturerController,
                  decoration:
                      const InputDecoration(labelText: 'BikeManufacturer'),
                ),
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'Id'),
                ),
                TextField(
                  controller: imageController,
                  decoration: const InputDecoration(labelText: 'Image'),
                ),
                TextField(
                  controller: rider1RacerController,
                  decoration: const InputDecoration(labelText: 'Rider1'),
                ),
                TextField(
                  controller: rider2Controller,
                  decoration: const InputDecoration(labelText: 'Rider2'),
                ),
                TextField(
                  controller: teamController,
                  decoration: const InputDecoration(labelText: 'Team'),
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
                  String documentId = riderInf['id'];

                  // Lấy dữ liệu từ Calendar/GrandsPrix
                  final snapshot = await FirebaseDatabase.instance
                      .ref('Riders&Team/Teams/MotoGP')
                      .get();

                  if (snapshot.exists) {
                    // Nếu tồn tại, thực hiện cập nhật
                    await FirebaseDatabase.instance
                        .ref('Riders&Team/Teams/MotoGP/$documentId')
                        .update({
                      'BikeManufacturer': bikeManufacturerController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'Rider1': rider1RacerController.text, //
                      'Rider2': rider2Controller.text,
                      'Team': teamController.text,
                    });

                    // Cập nhật lại danh sách trong ứng dụng
                    listDS[index] = {
                      ...riderInf,
                      'BikeManufacturer': bikeManufacturerController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'Rider1': rider1RacerController.text, //
                      'Rider2': rider2Controller.text,
                      'Team': teamController.text,
                    };

                    // Đóng dialog sau khi cập nhật thành công
                    Navigator.of(context).pop();
                    return;
                  }
                  // Lấy dữ liệu từ Calendar/AllEvents
                  final snapshot2 = await FirebaseDatabase.instance
                      .ref('Riders&Team/Teams/Moto2')
                      .get();

                  if (snapshot2.exists) {
                    // Nếu tồn tại, thực hiện cập nhật
                    await FirebaseDatabase.instance
                        .ref('Riders&Team/Teams/Moto2/$documentId')
                        .update({
                      'BikeManufacturer': bikeManufacturerController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'Rider1': rider1RacerController.text, //
                      'Rider2': rider2Controller.text,
                      'Team': teamController.text,
                    });

                    // Cập nhật lại danh sách trong ứng dụng
                    listDS[index] = {
                      ...riderInf,
                      'BikeManufacturer': bikeManufacturerController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'Rider1': rider1RacerController.text, //
                      'Rider2': rider2Controller.text,
                      'Team': teamController.text,
                    };

                    // Đóng dialog sau khi cập nhật thành công
                    Navigator.of(context).pop();
                    return;
                  }

                  // Lấy dữ liệu từ Calendar/AllEvents
                  final snapshot3 = await FirebaseDatabase.instance
                      .ref('Riders&Team/Teams/Moto3')
                      .get();

                  if (snapshot3.exists) {
                    // Nếu tồn tại, thực hiện cập nhật
                    await FirebaseDatabase.instance
                        .ref('Riders&Team/Teams/Moto3/$documentId')
                        .update({
                      'BikeManufacturer': bikeManufacturerController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'Rider1': rider1RacerController.text, //
                      'Rider2': rider2Controller.text,
                      'Team': teamController.text,
                    });

                    // Cập nhật lại danh sách trong ứng dụng
                    listDS[index] = {
                      ...riderInf,
                      'BikeManufacturer': bikeManufacturerController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'Rider1': rider1RacerController.text, //
                      'Rider2': rider2Controller.text,
                      'Team': teamController.text,
                    };

                    // Đóng dialog sau khi cập nhật thành công
                    Navigator.of(context).pop();
                    return;
                  }

                  // Lấy dữ liệu từ Calendar/AllEvents
                  final snapshot4 = await FirebaseDatabase.instance
                      .ref('Riders&Team/Teams/MotoE')
                      .get();

                  if (snapshot4.exists) {
                    // Nếu tồn tại, thực hiện cập nhật
                    await FirebaseDatabase.instance
                        .ref('Riders&Team/Teams/MotoE/$documentId')
                        .update({
                      'BikeManufacturer': bikeManufacturerController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'Rider1': rider1RacerController.text, //
                      'Rider2': rider2Controller.text,
                      'Team': teamController.text,
                    });

                    // Cập nhật lại danh sách trong ứng dụng
                    listDS[index] = {
                      ...riderInf,
                      'BikeManufacturer': bikeManufacturerController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'Rider1': rider1RacerController.text, //
                      'Rider2': rider2Controller.text,
                      'Team': teamController.text,
                    };

                    // Đóng dialog sau khi cập nhật thành công
                    Navigator.of(context).pop();
                    return;
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
