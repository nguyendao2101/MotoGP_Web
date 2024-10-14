// ignore_for_file: use_build_context_synchronously, avoid_print, invalid_use_of_protected_member

import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common_widget/rider_detail.dart';

class SliverGridRiders extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final RxList<Map<String, dynamic>>
      listDS; // Truyền thêm danh sách ridersListMotoGP

  const SliverGridRiders(
      {super.key, required this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final riders = listDS.value;
      // Sử dụng danh sách ridersListMotoGP thay vì lấy trực tiếp từ controller
      if (listDS.isEmpty) {
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
                var rider =
                    listDS[index]; // Sử dụng ridersListMotoGP truyền vào
                return InkWell(
                  onTap: () {
                    Get.to(() => RiderDetailScreen(rider: rider));
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
                            '#${rider['Id']}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                rider['Name'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
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
                                          context, riders[index], index);
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
                                        String documentId = riders[index]['id'];

                                        // Lấy dữ liệu từ Calendar/GrandsPrix
                                        final snapshot = await FirebaseDatabase
                                            .instance
                                            .ref('Riders&Team/Riders/MotoGP')
                                            .get();

                                        if (snapshot.exists) {
                                          // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                                          for (var grandPrixEntry
                                              in snapshot.children) {
                                            // Kiểm tra xem documentId có tồn tại trong nhánh này không
                                            final addCalendarSnapshot =
                                                grandPrixEntry
                                                    .child(documentId);
                                            if (addCalendarSnapshot.exists) {
                                              // Nếu tồn tại, thực hiện xóa
                                              await FirebaseDatabase.instance
                                                  .ref(
                                                      'Riders&Team/Riders/MotoGP/${grandPrixEntry.key}/$documentId')
                                                  .remove();

                                              // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                              listDS.removeAt(index);

                                              // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                              return;
                                            }
                                          }
                                        }

                                        // Lấy dữ liệu từ Calendar/GrandsPrix
                                        final snapshot2 = await FirebaseDatabase
                                            .instance
                                            .ref('Riders&Team/Riders/Moto2')
                                            .get();

                                        if (snapshot2.exists) {
                                          // Duyệt qua từng nhánh con của Calendar/AllEvents
                                          for (var allEventsEntry
                                              in snapshot2.children) {
                                            // Kiểm tra xem documentId có tồn tại trong nhánh này không
                                            final addCalendarSnapshot =
                                                allEventsEntry
                                                    .child(documentId);
                                            if (addCalendarSnapshot.exists) {
                                              // Nếu tồn tại, thực hiện xóa
                                              await FirebaseDatabase.instance
                                                  .ref(
                                                      'Riders&Team/Riders/Moto2/${allEventsEntry.key}/$documentId')
                                                  .remove();

                                              // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                              listDS.removeAt(index);

                                              // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                              return;
                                            }
                                          }
                                        }

                                        // Lấy dữ liệu từ Calendar/GrandsPrix
                                        final snapshot3 = await FirebaseDatabase
                                            .instance
                                            .ref('Riders&Team/Riders/Moto3')
                                            .get();

                                        if (snapshot3.exists) {
                                          // Duyệt qua từng nhánh con của Calendar/AllEvents
                                          for (var allEventsEntry
                                              in snapshot3.children) {
                                            // Kiểm tra xem documentId có tồn tại trong nhánh này không
                                            final addCalendarSnapshot =
                                                allEventsEntry
                                                    .child(documentId);
                                            if (addCalendarSnapshot.exists) {
                                              // Nếu tồn tại, thực hiện xóa
                                              await FirebaseDatabase.instance
                                                  .ref(
                                                      'Riders&Team/Riders/Moto3/${allEventsEntry.key}/$documentId')
                                                  .remove();

                                              // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                              listDS.removeAt(index);

                                              // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                              return;
                                            }
                                          }
                                        }

                                        // Lấy dữ liệu từ Calendar/GrandsPrix
                                        final snapshot4 = await FirebaseDatabase
                                            .instance
                                            .ref('Riders&Team/Riders/MotoE')
                                            .get();

                                        if (snapshot4.exists) {
                                          // Duyệt qua từng nhánh con của Calendar/AllEvents
                                          for (var allEventsEntry
                                              in snapshot4.children) {
                                            // Kiểm tra xem documentId có tồn tại trong nhánh này không
                                            final addCalendarSnapshot =
                                                allEventsEntry
                                                    .child(documentId);
                                            if (addCalendarSnapshot.exists) {
                                              // Nếu tồn tại, thực hiện xóa
                                              await FirebaseDatabase.instance
                                                  .ref(
                                                      'Riders&Team/Riders/MotoE/${allEventsEntry.key}/$documentId')
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
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.network(
                                rider['ImageCountry'],
                                height: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rider['Country'],
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(width: 4),
                              const Text('|',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(width: 4),
                              Text(
                                rider['Team'],
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
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
                        rider['ImageRacer'] != ''
                            ? Image.network(
                                rider['ImageRacer'],
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

  // Hàm tạo màu ngẫu nhiên
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
    final TextEditingController countryController =
        TextEditingController(text: riderInf['Country'].toString()); //
    final TextEditingController idController =
        TextEditingController(text: riderInf['Id'].toString()); //
    final TextEditingController imageCountryController =
        TextEditingController(text: riderInf['ImageCountry'].toString()); //
    final TextEditingController imageRacerController =
        TextEditingController(text: riderInf['ImageRacer'].toString()); //
    //
    final TextEditingController moto2PodiumsController =
        TextEditingController(text: riderInf['Moto2Podiums'].toString());

    final TextEditingController moto2PolesController =
        TextEditingController(text: riderInf['Moto2Poles'].toString());

    final TextEditingController moto2RacesController =
        TextEditingController(text: riderInf['Moto2Races'].toString()); //

    final TextEditingController moto2VictoriesController =
        TextEditingController(text: riderInf['Moto2Victories'].toString());

    final TextEditingController moto2WorldChampionshipsController =
        TextEditingController(
            text: riderInf['Moto2WorldChampionships'].toString());

    final TextEditingController moto3PodiumsController =
        TextEditingController(text: riderInf['Moto3Podiums'].toString());

    final TextEditingController moto3PolesController =
        TextEditingController(text: riderInf['Moto3Poles'].toString());

    final TextEditingController moto3RacesController =
        TextEditingController(text: riderInf['Moto3Races'].toString());

    final TextEditingController moto3VictoriesController =
        TextEditingController(text: riderInf['Moto3Victories'].toString());

    final TextEditingController moto3WorldChampionshipsController =
        TextEditingController(
            text: riderInf['Moto3WorldChampionships'].toString());

    final TextEditingController motoGPPodiumsController =
        TextEditingController(text: riderInf['MotoGPPodiums'].toString());

    final TextEditingController motoGPPolesController =
        TextEditingController(text: riderInf['MotoGPPoles'].toString());

    final TextEditingController motoGPRacesController =
        TextEditingController(text: riderInf['MotoGPRaces'].toString());

    final TextEditingController motoGPVictoriesController =
        TextEditingController(text: riderInf['MotoGPVictories'].toString());

    final TextEditingController motoGPWorldChampionshipsController =
        TextEditingController(
            text: riderInf['MotoGPWorldChampionships'].toString());

    final TextEditingController mameController =
        TextEditingController(text: riderInf['Name'].toString()); //

    final TextEditingController pointsController =
        TextEditingController(text: riderInf['Points'].toString());

    final TextEditingController positionController =
        TextEditingController(text: riderInf['Position'].toString());

    final TextEditingController teamController =
        TextEditingController(text: riderInf['Team'].toString()); //

    final TextEditingController teamMateImageController =
        TextEditingController(text: riderInf['TeamMateImage'].toString()); //

    final TextEditingController teamMateNameController =
        TextEditingController(text: riderInf['TeamMateName'].toString()); //

    final TextEditingController totalPodiumsController =
        TextEditingController(text: riderInf['TotalPodiums'].toString());

    final TextEditingController totalPolesController =
        TextEditingController(text: riderInf['TotalPoles'].toString());

    final TextEditingController totalRacesController =
        TextEditingController(text: riderInf['TotalRaces'].toString());

    final TextEditingController totalVictoriesController =
        TextEditingController(text: riderInf['TotalVictories'].toString());

    final TextEditingController totalWorldChampionshipsController =
        TextEditingController(
            text: riderInf['TotalWorldChampionships'].toString());

    final TextEditingController victoriesController =
        TextEditingController(text: riderInf['Victories'].toString());

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
                  controller: countryController,
                  decoration: const InputDecoration(labelText: 'Country'),
                ),
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'Id'),
                ),
                TextField(
                  controller: imageCountryController,
                  decoration: const InputDecoration(labelText: 'ImageCountry'),
                ),
                TextField(
                  controller: imageRacerController,
                  decoration: const InputDecoration(labelText: 'ImageRacer'),
                ),
                TextField(
                  controller: moto2PodiumsController,
                  decoration: const InputDecoration(labelText: 'Moto2Podiums'),
                ),
                TextField(
                  controller: moto2PolesController,
                  decoration: const InputDecoration(labelText: 'Moto2Poles'),
                ),
                TextField(
                  controller: moto2RacesController,
                  decoration: const InputDecoration(labelText: 'Moto2Races'),
                ),
                TextField(
                  controller: moto2VictoriesController,
                  decoration:
                      const InputDecoration(labelText: 'Moto2Victories'),
                ),
                TextField(
                  controller: moto2WorldChampionshipsController,
                  decoration: const InputDecoration(
                      labelText: 'Moto2WorldChampionships'),
                ),
                TextField(
                  controller: moto3PodiumsController,
                  decoration: const InputDecoration(labelText: 'Moto3Podiums'),
                ),
                TextField(
                  controller: moto3PolesController,
                  decoration: const InputDecoration(labelText: 'Moto3Poles'),
                ),
                TextField(
                  controller: moto3RacesController,
                  decoration: const InputDecoration(labelText: 'Moto3Races'),
                ),
                TextField(
                  controller: moto3VictoriesController,
                  decoration:
                      const InputDecoration(labelText: 'Moto3Victories'),
                ),
                TextField(
                  controller: moto3WorldChampionshipsController,
                  decoration: const InputDecoration(
                      labelText: 'Moto3WorldChampionships'),
                ),
                TextField(
                  controller: motoGPPodiumsController,
                  decoration: const InputDecoration(labelText: 'MotoGPPodiums'),
                ),
                TextField(
                  controller: motoGPPolesController,
                  decoration: const InputDecoration(labelText: 'MotoGPPoles'),
                ),
                TextField(
                  controller: motoGPRacesController,
                  decoration: const InputDecoration(labelText: 'MotoGPRaces'),
                ),
                TextField(
                  controller: motoGPVictoriesController,
                  decoration:
                      const InputDecoration(labelText: 'MotoGPVictories'),
                ),
                TextField(
                  controller: motoGPWorldChampionshipsController,
                  decoration: const InputDecoration(
                      labelText: 'MotoGPWorldChampionships'),
                ),
                TextField(
                  controller: mameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: pointsController,
                  decoration: const InputDecoration(labelText: 'Points'),
                ),
                TextField(
                  controller: positionController,
                  decoration: const InputDecoration(labelText: 'Position'),
                ),
                TextField(
                  controller: teamController,
                  decoration: const InputDecoration(labelText: 'Team'),
                ),
                TextField(
                  controller: teamMateImageController,
                  decoration: const InputDecoration(labelText: 'TeamMateImage'),
                ),
                TextField(
                  controller: teamMateNameController,
                  decoration: const InputDecoration(labelText: 'TeamMateName'),
                ),
                TextField(
                  controller: totalPodiumsController,
                  decoration: const InputDecoration(labelText: 'TotalPodiums'),
                ),
                TextField(
                  controller: totalPolesController,
                  decoration: const InputDecoration(labelText: 'TotalPoles'),
                ),
                TextField(
                  controller: totalRacesController,
                  decoration: const InputDecoration(labelText: 'TotalRaces'),
                ),
                TextField(
                  controller: totalVictoriesController,
                  decoration:
                      const InputDecoration(labelText: 'TotalVictories'),
                ),
                TextField(
                  controller: totalWorldChampionshipsController,
                  decoration: const InputDecoration(
                      labelText: 'TotalWorldChampionships'),
                ),
                TextField(
                  controller: victoriesController,
                  decoration: const InputDecoration(labelText: 'Victories'),
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
                      .ref('Riders&Team/Riders/MotoGP')
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
                                'Riders&Team/Riders/MotoGP/${grandPrixEntry.key}/$documentId')
                            .update({
                          'Country': countryController.text, //
                          'Id': idController.text, //
                          'ImageCountry': imageCountryController.text, //
                          'ImageRacer': imageRacerController.text, //
                          'Moto2Podiums': moto2PodiumsController.text,
                          'Moto2Poles': moto2PolesController.text,
                          'Moto2Races': moto2RacesController.text,
                          'Moto2Victories': moto2VictoriesController.text,
                          'Moto2WorldChampionships':
                              moto2WorldChampionshipsController.text,
                          'Moto3Podiums': moto3PodiumsController.text,
                          'Moto3Poles': moto3PolesController.text,
                          'Moto3Races': moto3RacesController.text,
                          'Moto3Victories': moto3VictoriesController.text,
                          'Moto3WorldChampionships':
                              moto3WorldChampionshipsController.text,
                          'MotoGPPodiums': motoGPPodiumsController.text,
                          'MotoGPPoles': motoGPPolesController.text,
                          'MotoGPRaces': motoGPRacesController.text,
                          'MotoGPVictories': motoGPVictoriesController.text,
                          'MotoGPWorldChampionships':
                              motoGPWorldChampionshipsController.text,
                          'Name': mameController.text, //
                          'Points': pointsController.text,
                          'Position': positionController.text,
                          'Team': teamController.text, //
                          'TeamMateImage': teamMateImageController.text, //
                          'TeamMateName': teamMateNameController.text, //
                          'TotalPodiums': totalPodiumsController.text,
                          'TotalPoles': totalPolesController.text,
                          'TotalRaces': totalRacesController.text,
                          'TotalVictories': totalVictoriesController.text,
                          'TotalWorldChampionships':
                              totalWorldChampionshipsController.text,
                          'Victories': victoriesController.text,
                        });

                        // Cập nhật lại danh sách trong ứng dụng
                        listDS[index] = {
                          ...riderInf,
                          'Country': countryController.text, //
                          'Id': idController.text, //
                          'ImageCountry': imageCountryController.text, //
                          'ImageRacer': imageRacerController.text, //
                          'Moto2Podiums': moto2PodiumsController.text,
                          'Moto2Poles': moto2PolesController.text,
                          'Moto2Races': moto2RacesController.text,
                          'Moto2Victories': moto2VictoriesController.text,
                          'Moto2WorldChampionships':
                              moto2WorldChampionshipsController.text,
                          'Moto3Podiums': moto3PodiumsController.text,
                          'Moto3Poles': moto3PolesController.text,
                          'Moto3Races': moto3RacesController.text,
                          'Moto3Victories': moto3VictoriesController.text,
                          'Moto3WorldChampionships':
                              moto3WorldChampionshipsController.text,
                          'MotoGPPodiums': motoGPPodiumsController.text,
                          'MotoGPPoles': motoGPPolesController.text,
                          'MotoGPRaces': motoGPRacesController.text,
                          'MotoGPVictories': motoGPVictoriesController.text,
                          'MotoGPWorldChampionships':
                              motoGPWorldChampionshipsController.text,
                          'Name': mameController.text, //
                          'Points': pointsController.text,
                          'Position': positionController.text,
                          'Team': teamController.text, //
                          'TeamMateImage': teamMateImageController.text, //
                          'TeamMateName': teamMateNameController.text, //
                          'TotalPodiums': totalPodiumsController.text,
                          'TotalPoles': totalPolesController.text,
                          'TotalRaces': totalRacesController.text,
                          'TotalVictories': totalVictoriesController.text,
                          'TotalWorldChampionships':
                              totalWorldChampionshipsController.text,
                          'Victories': victoriesController.text,
                        };

                        // Đóng dialog sau khi cập nhật thành công
                        Navigator.of(context).pop();
                        return;
                      }
                    }
                  }
                  // Lấy dữ liệu từ Calendar/AllEvents
                  final snapshot2 = await FirebaseDatabase.instance
                      .ref('Riders&Team/Riders/Moto2')
                      .get();

                  if (snapshot2.exists) {
                    // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                    for (var grandPrixEntry in snapshot2.children) {
                      // Kiểm tra xem documentId có tồn tại trong nhánh này không
                      final addCalendarSnapshot =
                          grandPrixEntry.child(documentId);
                      if (addCalendarSnapshot.exists) {
                        // Nếu tồn tại, thực hiện cập nhật
                        await FirebaseDatabase.instance
                            .ref(
                                'Riders&Team/Riders/Moto2/${grandPrixEntry.key}/$documentId')
                            .update({
                          'Country': countryController.text, //
                          'Id': idController.text, //
                          'ImageCountry': imageCountryController.text, //
                          'ImageRacer': imageRacerController.text, //
                          'Moto2Podiums': moto2PodiumsController.text,
                          'Moto2Poles': moto2PolesController.text,
                          'Moto2Races': moto2RacesController.text,
                          'Moto2Victories': moto2VictoriesController.text,
                          'Moto2WorldChampionships':
                              moto2WorldChampionshipsController.text,
                          'Moto3Podiums': moto3PodiumsController.text,
                          'Moto3Poles': moto3PolesController.text,
                          'Moto3Races': moto3RacesController.text,
                          'Moto3Victories': moto3VictoriesController.text,
                          'Moto3WorldChampionships':
                              moto3WorldChampionshipsController.text,
                          'MotoGPPodiums': motoGPPodiumsController.text,
                          'MotoGPPoles': motoGPPolesController.text,
                          'MotoGPRaces': motoGPRacesController.text,
                          'MotoGPVictories': motoGPVictoriesController.text,
                          'MotoGPWorldChampionships':
                              motoGPWorldChampionshipsController.text,
                          'Name': mameController.text, //
                          'Points': pointsController.text,
                          'Position': positionController.text,
                          'Team': teamController.text, //
                          'TeamMateImage': teamMateImageController.text, //
                          'TeamMateName': teamMateNameController.text, //
                          'TotalPodiums': totalPodiumsController.text,
                          'TotalPoles': totalPolesController.text,
                          'TotalRaces': totalRacesController.text,
                          'TotalVictories': totalVictoriesController.text,
                          'TotalWorldChampionships':
                              totalWorldChampionshipsController.text,
                          'Victories': victoriesController.text,
                        });

                        // Cập nhật lại danh sách trong ứng dụng
                        listDS[index] = {
                          ...riderInf,
                          'Country': countryController.text, //
                          'Id': idController.text, //
                          'ImageCountry': imageCountryController.text, //
                          'ImageRacer': imageRacerController.text, //
                          'Moto2Podiums': moto2PodiumsController.text,
                          'Moto2Poles': moto2PolesController.text,
                          'Moto2Races': moto2RacesController.text,
                          'Moto2Victories': moto2VictoriesController.text,
                          'Moto2WorldChampionships':
                              moto2WorldChampionshipsController.text,
                          'Moto3Podiums': moto3PodiumsController.text,
                          'Moto3Poles': moto3PolesController.text,
                          'Moto3Races': moto3RacesController.text,
                          'Moto3Victories': moto3VictoriesController.text,
                          'Moto3WorldChampionships':
                              moto3WorldChampionshipsController.text,
                          'MotoGPPodiums': motoGPPodiumsController.text,
                          'MotoGPPoles': motoGPPolesController.text,
                          'MotoGPRaces': motoGPRacesController.text,
                          'MotoGPVictories': motoGPVictoriesController.text,
                          'MotoGPWorldChampionships':
                              motoGPWorldChampionshipsController.text,
                          'Name': mameController.text, //
                          'Points': pointsController.text,
                          'Position': positionController.text,
                          'Team': teamController.text, //
                          'TeamMateImage': teamMateImageController.text, //
                          'TeamMateName': teamMateNameController.text, //
                          'TotalPodiums': totalPodiumsController.text,
                          'TotalPoles': totalPolesController.text,
                          'TotalRaces': totalRacesController.text,
                          'TotalVictories': totalVictoriesController.text,
                          'TotalWorldChampionships':
                              totalWorldChampionshipsController.text,
                          'Victories': victoriesController.text,
                        };

                        // Đóng dialog sau khi cập nhật thành công
                        Navigator.of(context).pop();
                        return;
                      }
                    }
                  }

                  // Lấy dữ liệu từ Calendar/AllEvents
                  final snapshot3 = await FirebaseDatabase.instance
                      .ref('Riders&Team/Riders/Moto3')
                      .get();

                  if (snapshot3.exists) {
                    // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                    for (var grandPrixEntry in snapshot3.children) {
                      // Kiểm tra xem documentId có tồn tại trong nhánh này không
                      final addCalendarSnapshot =
                          grandPrixEntry.child(documentId);
                      if (addCalendarSnapshot.exists) {
                        // Nếu tồn tại, thực hiện cập nhật
                        await FirebaseDatabase.instance
                            .ref(
                                'Riders&Team/Riders/Moto3/${grandPrixEntry.key}/$documentId')
                            .update({
                          'Country': countryController.text, //
                          'Id': idController.text, //
                          'ImageCountry': imageCountryController.text, //
                          'ImageRacer': imageRacerController.text, //
                          'Moto2Podiums': moto2PodiumsController.text,
                          'Moto2Poles': moto2PolesController.text,
                          'Moto2Races': moto2RacesController.text,
                          'Moto2Victories': moto2VictoriesController.text,
                          'Moto2WorldChampionships':
                              moto2WorldChampionshipsController.text,
                          'Moto3Podiums': moto3PodiumsController.text,
                          'Moto3Poles': moto3PolesController.text,
                          'Moto3Races': moto3RacesController.text,
                          'Moto3Victories': moto3VictoriesController.text,
                          'Moto3WorldChampionships':
                              moto3WorldChampionshipsController.text,
                          'MotoGPPodiums': motoGPPodiumsController.text,
                          'MotoGPPoles': motoGPPolesController.text,
                          'MotoGPRaces': motoGPRacesController.text,
                          'MotoGPVictories': motoGPVictoriesController.text,
                          'MotoGPWorldChampionships':
                              motoGPWorldChampionshipsController.text,
                          'Name': mameController.text, //
                          'Points': pointsController.text,
                          'Position': positionController.text,
                          'Team': teamController.text, //
                          'TeamMateImage': teamMateImageController.text, //
                          'TeamMateName': teamMateNameController.text, //
                          'TotalPodiums': totalPodiumsController.text,
                          'TotalPoles': totalPolesController.text,
                          'TotalRaces': totalRacesController.text,
                          'TotalVictories': totalVictoriesController.text,
                          'TotalWorldChampionships':
                              totalWorldChampionshipsController.text,
                          'Victories': victoriesController.text,
                        });

                        // Cập nhật lại danh sách trong ứng dụng
                        listDS[index] = {
                          ...riderInf,
                          'Country': countryController.text, //
                          'Id': idController.text, //
                          'ImageCountry': imageCountryController.text, //
                          'ImageRacer': imageRacerController.text, //
                          'Moto2Podiums': moto2PodiumsController.text,
                          'Moto2Poles': moto2PolesController.text,
                          'Moto2Races': moto2RacesController.text,
                          'Moto2Victories': moto2VictoriesController.text,
                          'Moto2WorldChampionships':
                              moto2WorldChampionshipsController.text,
                          'Moto3Podiums': moto3PodiumsController.text,
                          'Moto3Poles': moto3PolesController.text,
                          'Moto3Races': moto3RacesController.text,
                          'Moto3Victories': moto3VictoriesController.text,
                          'Moto3WorldChampionships':
                              moto3WorldChampionshipsController.text,
                          'MotoGPPodiums': motoGPPodiumsController.text,
                          'MotoGPPoles': motoGPPolesController.text,
                          'MotoGPRaces': motoGPRacesController.text,
                          'MotoGPVictories': motoGPVictoriesController.text,
                          'MotoGPWorldChampionships':
                              motoGPWorldChampionshipsController.text,
                          'Name': mameController.text, //
                          'Points': pointsController.text,
                          'Position': positionController.text,
                          'Team': teamController.text, //
                          'TeamMateImage': teamMateImageController.text, //
                          'TeamMateName': teamMateNameController.text, //
                          'TotalPodiums': totalPodiumsController.text,
                          'TotalPoles': totalPolesController.text,
                          'TotalRaces': totalRacesController.text,
                          'TotalVictories': totalVictoriesController.text,
                          'TotalWorldChampionships':
                              totalWorldChampionshipsController.text,
                          'Victories': victoriesController.text,
                        };

                        // Đóng dialog sau khi cập nhật thành công
                        Navigator.of(context).pop();
                        return;
                      }
                    }
                  }

                  // Lấy dữ liệu từ Calendar/AllEvents
                  final snapshot4 = await FirebaseDatabase.instance
                      .ref('Riders&Team/Riders/MotoE')
                      .get();

                  if (snapshot4.exists) {
                    // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                    for (var grandPrixEntry in snapshot4.children) {
                      // Kiểm tra xem documentId có tồn tại trong nhánh này không
                      final addCalendarSnapshot =
                          grandPrixEntry.child(documentId);
                      if (addCalendarSnapshot.exists) {
                        // Nếu tồn tại, thực hiện cập nhật
                        await FirebaseDatabase.instance
                            .ref(
                                'Riders&Team/Riders/MotoE/${grandPrixEntry.key}/$documentId')
                            .update({
                          'Country': countryController.text, //
                          'Id': idController.text, //
                          'ImageCountry': imageCountryController.text, //
                          'ImageRacer': imageRacerController.text, //
                          'Moto2Podiums': moto2PodiumsController.text,
                          'Moto2Poles': moto2PolesController.text,
                          'Moto2Races': moto2RacesController.text,
                          'Moto2Victories': moto2VictoriesController.text,
                          'Moto2WorldChampionships':
                              moto2WorldChampionshipsController.text,
                          'Moto3Podiums': moto3PodiumsController.text,
                          'Moto3Poles': moto3PolesController.text,
                          'Moto3Races': moto3RacesController.text,
                          'Moto3Victories': moto3VictoriesController.text,
                          'Moto3WorldChampionships':
                              moto3WorldChampionshipsController.text,
                          'MotoGPPodiums': motoGPPodiumsController.text,
                          'MotoGPPoles': motoGPPolesController.text,
                          'MotoGPRaces': motoGPRacesController.text,
                          'MotoGPVictories': motoGPVictoriesController.text,
                          'MotoGPWorldChampionships':
                              motoGPWorldChampionshipsController.text,
                          'Name': mameController.text, //
                          'Points': pointsController.text,
                          'Position': positionController.text,
                          'Team': teamController.text, //
                          'TeamMateImage': teamMateImageController.text, //
                          'TeamMateName': teamMateNameController.text, //
                          'TotalPodiums': totalPodiumsController.text,
                          'TotalPoles': totalPolesController.text,
                          'TotalRaces': totalRacesController.text,
                          'TotalVictories': totalVictoriesController.text,
                          'TotalWorldChampionships':
                              totalWorldChampionshipsController.text,
                          'Victories': victoriesController.text,
                        });

                        // Cập nhật lại danh sách trong ứng dụng
                        listDS[index] = {
                          ...riderInf,
                          'Country': countryController.text, //
                          'Id': idController.text, //
                          'ImageCountry': imageCountryController.text, //
                          'ImageRacer': imageRacerController.text, //
                          'Moto2Podiums': moto2PodiumsController,
                          'Moto2Poles': moto2PolesController.text,
                          'Moto2Races': moto2RacesController.text,
                          'Moto2Victories': moto2VictoriesController.text,
                          'Moto2WorldChampionships':
                              moto2WorldChampionshipsController.text,
                          'Moto3Podiums': moto3PodiumsController.text,
                          'Moto3Poles': moto3PolesController.text,
                          'Moto3Races': moto3RacesController.text,
                          'Moto3Victories': moto3VictoriesController.text,
                          'Moto3WorldChampionships':
                              moto3WorldChampionshipsController.text,
                          'MotoGPPodiums': motoGPPodiumsController.text,
                          'MotoGPPoles': motoGPPolesController.text,
                          'MotoGPRaces': motoGPRacesController.text,
                          'MotoGPVictories': motoGPVictoriesController.text,
                          'MotoGPWorldChampionships':
                              motoGPWorldChampionshipsController.text,
                          'Name': mameController.text, //
                          'Points': pointsController.text,
                          'Position': positionController.text,
                          'Team': teamController.text, //
                          'TeamMateImage': teamMateImageController.text, //
                          'TeamMateName': teamMateNameController.text, //
                          'TotalPodiums': totalPodiumsController.text,
                          'TotalPoles': totalPolesController.text,
                          'TotalRaces': totalRacesController.text,
                          'TotalVictories': totalVictoriesController.text,
                          'TotalWorldChampionships':
                              totalWorldChampionshipsController.text,
                          'Victories': victoriesController.text,
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
