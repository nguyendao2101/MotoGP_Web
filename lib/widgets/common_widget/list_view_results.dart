import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common_widget/rider_detail.dart';
import '../../view_model/riders_and_teams_view_models.dart';

class SliverListRiders extends StatelessWidget {
  final RidersAndTeamsViewModels controller;
  final List<dynamic> listDS; // Truyền thêm danh sách ridersListMotoGP

  const SliverListRiders(
      {super.key, required this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Sử dụng danh sách ridersListMotoGP thay vì lấy trực tiếp từ controller
      if (listDS.isEmpty) {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var rider =
                    listDS[index]; // Sử dụng ridersListMotoGP truyền vào
                return InkWell(
                  onTap: () {
                    Get.to(() => RiderDetailScreen(rider: rider));
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: CircleAvatar(
                        backgroundImage: rider['ImageRacer'] != ''
                            ? NetworkImage(rider['ImageRacer'])
                            : null,
                        child: rider['ImageRacer'] == ''
                            ? const Icon(Icons.person,
                                size: 50, color: Colors.grey)
                            : null,
                      ),
                      title: Text(
                        rider['Name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Row(
                        children: [
                          Image.network(
                            rider['ImageCountry'],
                            height: 20,
                          ),
                          const SizedBox(width: 4),
                          const Text('|',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20)),
                          const SizedBox(width: 4),
                          Text(
                            rider['Team'],
                            style: const TextStyle(color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      trailing: Text(
                        '#${rider['Id']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
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
}
