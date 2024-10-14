// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously, invalid_use_of_protected_member

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'riders_legends_detail.dart';

class GridViewLegends extends StatelessWidget {
  final controller;
  final RxList<Map<String, dynamic>> listDS;
  const GridViewLegends({super.key, this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final resultsList = listDS.value;

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
                    Get.to(() => RidersLegendsDetail(rider: rider));
                  },
                  child: GridTile(
                    footer: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    rider['Years Active'],
                                    style: const TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
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
                                        .ref('Riders&Team/Legends')
                                        .get();

                                    if (snapshot.exists) {
                                      // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                                      // Nếu documentId tồn tại, thực hiện xóa
                                      await FirebaseDatabase.instance
                                          .ref(
                                              'Riders&Team/Legends/$documentId')
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
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Color(0xFF3B3030),
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

  void _showEditDialog(
      BuildContext context, Map<String, dynamic> riderInf, int index) {
    final TextEditingController countryController =
        TextEditingController(text: riderInf['Country'].toString()); //
    final TextEditingController debutController =
        TextEditingController(text: riderInf['Debut'].toString()); //
    final TextEditingController idController =
        TextEditingController(text: riderInf['Id'].toString()); //
    final TextEditingController imageController =
        TextEditingController(text: riderInf['Image'].toString()); //
    //
    final TextEditingController imageCountryController =
        TextEditingController(text: riderInf['ImageCountry'].toString());

    final TextEditingController lastRaceController =
        TextEditingController(text: riderInf['Last Race'].toString());
    final TextEditingController nameController =
        TextEditingController(text: riderInf['Name'].toString());
    final TextEditingController seasonsController =
        TextEditingController(text: riderInf['Seasons'].toString());
    final TextEditingController toTalPolesController =
        TextEditingController(text: riderInf['ToTalPoles'].toString());
    final TextEditingController totalPodiumsController =
        TextEditingController(text: riderInf['TotalPodiums'].toString());
    final TextEditingController totalRacesController =
        TextEditingController(text: riderInf['TotalRaces'].toString());
    final TextEditingController totalVictoriesController =
        TextEditingController(text: riderInf['TotalVictories'].toString());
    final TextEditingController totalWorldChampionshipsController =
        TextEditingController(
            text: riderInf['TotalWorldChampionships'].toString());
    final TextEditingController worldChampionshipTitlesController =
        TextEditingController(
            text: riderInf['WorldChampionshipTitles'].toString());
    final TextEditingController yearsActiveController =
        TextEditingController(text: riderInf['Years Active'].toString());

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
                  controller: debutController,
                  decoration: const InputDecoration(labelText: 'Debut'),
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
                  controller: imageCountryController,
                  decoration: const InputDecoration(labelText: 'ImageCountry'),
                ),
                TextField(
                  controller: lastRaceController,
                  decoration: const InputDecoration(labelText: 'Last Race'),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: seasonsController,
                  decoration: const InputDecoration(labelText: 'Seasons'),
                ),
                TextField(
                  controller: toTalPolesController,
                  decoration: const InputDecoration(labelText: 'ToTalPoles'),
                ),
                TextField(
                  controller: totalPodiumsController,
                  decoration: const InputDecoration(labelText: 'TotalPodiums'),
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
                  controller: worldChampionshipTitlesController,
                  decoration: const InputDecoration(
                      labelText: 'WorldChampionshipTitles'),
                ),
                TextField(
                  controller: yearsActiveController,
                  decoration: const InputDecoration(labelText: 'Years Active'),
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
                      .ref('Riders&Team/Legends')
                      .get();

                  if (snapshot.exists) {
                    // Nếu tồn tại, thực hiện cập nhật
                    await FirebaseDatabase.instance
                        .ref('Riders&Team/Legends/$documentId')
                        .update({
                      'Country': countryController.text, //
                      'Debut': debutController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'ImageCountry': imageCountryController.text,
                      'Last Race': lastRaceController.text,
                      'Name': nameController.text,
                      'Seasons': seasonsController.text,
                      'ToTalPoles': toTalPolesController.text,
                      'TotalPodiums': totalPodiumsController.text,
                      'TotalRaces': totalRacesController.text,
                      'TotalVictories': totalVictoriesController.text,
                      'TotalWorldChampionships':
                          totalWorldChampionshipsController.text,
                      'WorldChampionshipTitles':
                          worldChampionshipTitlesController.text,
                      'Years Active': yearsActiveController.text,
                    });

                    // Cập nhật lại danh sách trong ứng dụng
                    listDS[index] = {
                      ...riderInf,
                      'Country': countryController.text, //
                      'Debut': debutController.text, //
                      'Id': idController.text, //
                      'Image': imageController.text, //
                      'ImageCountry': imageCountryController.text,
                      'Last Race': lastRaceController.text,
                      'Name': nameController.text,
                      'Seasons': seasonsController.text,
                      'ToTalPoles': toTalPolesController.text,
                      'TotalPodiums': totalPodiumsController.text,
                      'TotalRaces': totalRacesController.text,
                      'TotalVictories': totalVictoriesController.text,
                      'TotalWorldChampionships':
                          totalWorldChampionshipsController.text,
                      'WorldChampionshipTitles':
                          worldChampionshipTitlesController.text,
                      'Years Active': yearsActiveController.text,
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
