import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common_widget/rider_detail.dart';

class RidersAndTeamsRidersMotogp extends StatefulWidget {
  const RidersAndTeamsRidersMotogp({super.key});

  @override
  State<RidersAndTeamsRidersMotogp> createState() =>
      _RidersAndTeamsRidersMotogpState();
}

class _RidersAndTeamsRidersMotogpState
    extends State<RidersAndTeamsRidersMotogp> {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  List<Map<String, dynamic>> ridersList = [];

  @override
  void initState() {
    super.initState();
    _fetchRidersMotoGP();
  }

  void _fetchRidersMotoGP() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Riders&Team/Riders/MotoGP/Official');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> ridersMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        setState(() {
          // Duyệt qua từng rider trong `Official` và thêm vào danh sách `ridersList`
          ridersMap.forEach((key, value) {
            ridersList.add({
              'id': key,
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'Country': value['Country'] ?? 'N/A',
              'Id': value['Id'] ?? 'N/A',
              'ImageRacer': value['ImageRacer'] ?? '',
              'Name': value['Name'] ?? 'N/A',
              'Team': value['Team'] ?? 'N/A',
            });
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ridersList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Số lượng cột tối đa
                crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
                mainAxisSpacing: 8.0, // Khoảng cách giữa các hàng
              ),
              padding: EdgeInsets.all(8.0),
              itemCount: ridersList.length,
              itemBuilder: (context, index) {
                var rider = ridersList[index];

                return InkWell(
                  onTap: () {
                    Get.to(() => RiderDetailScreen(rider: rider));
                  },
                  child: GridTile(
                    footer: Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.black54, // Nền màu tối cho footer
                      ),
                      padding: EdgeInsets.all(8.0),
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
                              const SizedBox(
                                width: 4,
                              ),
                              const Text(
                                '|',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                rider['Team'],
                                style: TextStyle(color: Colors.white),
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
                                _randomColor()
                              ], // Các màu gradient
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ), // Màu nền cố định cho ảnh
                        ),
                        rider['ImageRacer'] != ''
                            ? Image.network(
                                rider['ImageRacer'],
                                fit: BoxFit.cover,
                              )
                            : Icon(Icons.person, size: 50, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
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
}
