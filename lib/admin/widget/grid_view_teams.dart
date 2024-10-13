// ignore_for_file: invalid_use_of_protected_member

import 'dart:math';

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
                          Text(
                            riderDetails['Name'],
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
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
}
