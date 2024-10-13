import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common_widget/rider_detail.dart';

class SliverGridRiders extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final List<dynamic> listDS; // Truyền thêm danh sách ridersListMotoGP

  const SliverGridRiders(
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
}
