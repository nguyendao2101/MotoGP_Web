// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';

import '../../view/riders_and_teams_riders_view.dart';
import 'rider_detail.dart';

class RidersAndTeamsTeamsDetail extends StatelessWidget {
  final Map<String, dynamic> team;
  final Map<String, dynamic> teamsDetail;

  const RidersAndTeamsTeamsDetail(
      {super.key, required this.team, required this.teamsDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A L L  T E A M S',
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blueAccent.withOpacity(0.8)
              ], // Các màu gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Gradient background
                Container(
                  height: 900, // Đặt chiều cao cố định để tránh lỗi
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.blueAccent.withOpacity(0.8)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        // Hình ảnh của rider
                        Positioned.fill(
                          top: 100,
                          right: -800,
                          child: team['Image'] != ''
                              ? Image.network(
                                  team['Image'],
                                  fit: BoxFit.contain,
                                )
                              : const Icon(Icons.person,
                                  size: 250, color: Colors.grey),
                        ),
                        // Thông tin của rider
                        Positioned(
                          top: 16,
                          left: 64,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${team['Team']}',
                                style: const TextStyle(
                                    fontSize: 68,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  text: 'BIKE MANUFACTURER: ',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: team['BikeManufacturer'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 450,
                          left: 70,
                          child: Row(
                            children: [
                              Image.asset(
                                ImageAssest.redFlag,
                                height: 50,
                              ),
                              const Text(
                                'Team Riders',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 500,
                          left: 70,
                          child: Container(
                            height: 210,
                            width: 400,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => RiderDetailScreen(
                                                  rider: teamsDetail,
                                                ));
                                          },
                                          child: Row(
                                            children: [
                                              teamsDetail['ImageRacer'] !=
                                                          null &&
                                                      teamsDetail[
                                                              'ImageRacer'] !=
                                                          ''
                                                  ? Image.network(
                                                      teamsDetail['ImageRacer'],
                                                      height: 80,
                                                      width: 80,
                                                    )
                                                  : Icon(
                                                      Icons.image_not_supported,
                                                      size: 80,
                                                      color: Colors.grey,
                                                    ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  team['Rider1'] != null &&
                                                          team['Rider1'] != ''
                                                      ? Text(
                                                          '#${team['Rider1']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .grey),
                                                        )
                                                      : Icon(
                                                          Icons.person,
                                                          color: Colors.grey,
                                                          size: 20,
                                                        ),
                                                  teamsDetail['Name'] != null &&
                                                          teamsDetail['Name'] !=
                                                              ''
                                                      ? Text(
                                                          teamsDetail['Name'],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                        )
                                                      : Icon(
                                                          Icons.error_outline,
                                                          color: Colors.red,
                                                          size: 20,
                                                        ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Image.asset(
                                          ImageAssest.sangNgang,
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Get.to(() =>
                                                  const RidersAndTeamsRidersView());
                                            },
                                            child:
                                                // Row(
                                                //   children: [
                                                //     Image.network(
                                                //       teamsDetail['TeamMateImage'],
                                                //       height: 80,
                                                //       width: 80,
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 4,
                                                //     ),
                                                //     Column(
                                                //       crossAxisAlignment:
                                                //           CrossAxisAlignment.start,
                                                //       children: [
                                                //         Text(
                                                //           '#${team['Rider2']}',
                                                //           style: const TextStyle(
                                                //               fontSize: 16,
                                                //               color: Colors.grey),
                                                //         ),
                                                //         Text(
                                                //           teamsDetail['TeamMateName'],
                                                //           style: const TextStyle(
                                                //               fontSize: 20,
                                                //               fontWeight:
                                                //                   FontWeight.bold,
                                                //               color: Colors.white),
                                                //         ),
                                                //       ],
                                                //     )
                                                //   ],
                                                // ),
                                                Row(
                                              children: [
                                                teamsDetail['TeamMateImage'] !=
                                                            null &&
                                                        teamsDetail[
                                                                'TeamMateImage'] !=
                                                            ' '
                                                    ? Image.network(
                                                        teamsDetail[
                                                            'TeamMateImage'],
                                                        height: 80,
                                                        width: 80,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .image_not_supported,
                                                        size: 80,
                                                        color: Colors.grey,
                                                      ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    team['Rider2'] != null &&
                                                            team['Rider2'] != ''
                                                        ? Text(
                                                            '#${team['Rider2']}',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .grey),
                                                          )
                                                        : Icon(
                                                            Icons.person,
                                                            color: Colors.grey,
                                                            size: 20,
                                                          ),
                                                    teamsDetail['TeamMateName'] !=
                                                                null &&
                                                            teamsDetail[
                                                                    'TeamMateName'] !=
                                                                ''
                                                        ? Text(
                                                            teamsDetail[
                                                                'TeamMateName'],
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        : Icon(
                                                            Icons.error_outline,
                                                            color: Colors.red,
                                                            size: 20,
                                                          ),
                                                  ],
                                                )
                                              ],
                                            )),
                                        Image.asset(
                                          ImageAssest.sangNgang,
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
