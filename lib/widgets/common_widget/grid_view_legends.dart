// ignore_for_file: prefer_typing_uninitialized_variables

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
                      child: Column(
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
}
