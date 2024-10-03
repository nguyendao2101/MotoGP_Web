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
        resultsList.sort((a, b) => b['Points'].compareTo(a['Points']));

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
                          gradient: result['id'] == '1'
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
                                '#${result['id']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: result['id'] == '1'
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              Text(
                                result['Points'].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: result['id'] == '1'
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
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
                            color: result['id'] == '1'
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
                            color: result['id'] == '1'
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
                          color:
                              result['id'] == '1' ? Colors.white : Colors.grey,
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
}
