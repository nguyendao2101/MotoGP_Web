import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GrandPrixCard extends StatelessWidget {
  final controller;
  final RxList<Map<String, dynamic>>
      listDS; // Truyền thêm danh sách ridersListMotoGP

  const GrandPrixCard({
    super.key,
    this.controller,
    required this.listDS,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final calendarList = listDS.value;
      if (listDS.isEmpty) {
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var calendar = calendarList[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        padding: const EdgeInsets.symmetric(horizontal: 64),
                        decoration: BoxDecoration(
                          color: Colors.white, // Màu nền của Container
                          borderRadius: BorderRadius.circular(6), // Bo góc
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // Màu bóng mờ (đen mờ)
                              spreadRadius: 5, // Độ lan rộng của bóng
                              blurRadius: 10, // Độ mờ của bóng
                              offset: const Offset(
                                  0, 3), // Vị trí của bóng (trục x, trục y)
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              // dayStart,
                              calendar['DayStart'],
                              style: const TextStyle(
                                  fontSize: 58,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              '-',
                              style: const TextStyle(
                                  fontSize: 58,
                                  color: Color.fromARGB(255, 102, 94, 94),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              // dayEnd,
                              calendar['DayEnd'],
                              style: const TextStyle(
                                  fontSize: 58,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 46),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // grandPrixName,
                                  calendar['EventName'],
                                  style: const TextStyle(
                                      fontSize: 32,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Image.network(
                                      // grandCountry,
                                      calendar['ImageDetail'],
                                      height: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      // location,
                                      calendar['Location'],
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.network(
                          // grandPrixImage,
                          calendar['ImageCountry'],
                          height: 140,
                          width: 520,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 94,
                        left: 206,
                        child: Text(
                          // monthEnd,
                          calendar['MonthEnd'],
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 75, 73, 73),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 94,
                        left: 82,
                        child: Text(
                          // monthStart,
                          calendar['MonthStart'],
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 75, 73, 73),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: -20,
                        left: 45,
                        child: Container(
                          width: 160,
                          height: 32,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 180, 41, 31),
                                Colors.black,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // '  $gpNumber',
                                  '  ${calendar['Category']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: VerticalDivider(
                                    width: 1,
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  // '$raceStatus  ',
                                  '${calendar['Status']}  ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount:
                  calendarList.length, // Số lượng phần tử trong danh sách
            ),
          ),
        );
      }
    });
  }
}
