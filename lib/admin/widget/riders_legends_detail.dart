// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import '../../widgets/common/image_extention.dart';

class RidersLegendsDetail extends StatelessWidget {
  final Map<String, dynamic> rider;
  const RidersLegendsDetail({super.key, required this.rider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A L L  R I D E R S',
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
                          child: rider['ImageRacer'] != ''
                              ? Image.network(
                                  rider['ImageRacer'],
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
                                '#${rider['Id']}',
                                style: const TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                rider['Name'],
                                style: const TextStyle(
                                    fontSize: 68,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.network(
                                    rider['ImageCountry'],
                                    height: 30,
                                  ),
                                  _sizeBoxW4(),
                                  Text(
                                    rider['Country'],
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  _sizeBoxW4(),
                                  const Text(
                                    '|',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  _sizeBoxW4(),
                                  Text(
                                    rider['Years Active'],
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 450,
                          left: 70,
                          child: Container(
                            height: 130,
                            width: 280,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: _currentSeason(
                                    'WORLD CHAMPIONSHIP TILLES',
                                    rider['WorldChampionshipTitles']
                                        .toString()),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 585,
                          left: 70,
                          child: Container(
                            height: 130,
                            width: 280,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: _currentSeason(
                                    'DEBUT', rider['Debut'].toString()),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 450,
                          left: 355,
                          child: Container(
                            height: 130,
                            width: 280,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: _currentSeason(
                                    'SEASONS', rider['Seasons'].toString()),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 585,
                          left: 355,
                          child: Container(
                            height: 130,
                            width: 280,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: _currentSeason(
                                    'LAST RACE', rider['Last Race'].toString()),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 400,
                          left: 70,
                          child: Row(
                            children: [
                              Image.asset(
                                ImageAssest.redFlag,
                                height: 50,
                              ),
                              const Text(
                                'Career Highlight',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 50, bottom: 20),
              child: Row(
                children: [
                  Image.asset(ImageAssest.redFlag, height: 44),
                  const Text(
                    'Legends Stats',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            _textResult('TOTAL'),
            _rowResultsTotal(),
          ],
        ),
      ),
    );
  }

  dynamic zeroToS(dynamic number) {
    return number == 0 ? '-' : number;
  }

  Padding _rowResultsTotal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _containerResultDetail('WORLD CHAMPIONSHIPS',
              zeroToS(rider['TotalWorldChampionships']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'VICTORIES', zeroToS(rider['TotalVictories']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'PODIUMS', zeroToS(rider['TotalPodiums']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'POLES', zeroToS(rider['ToTalPoles']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'RACES', zeroToS(rider['TotalRaces']).toString()),
        ],
      ),
    );
  }

  Container _containerResultDetail(String text, String number) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white, // Màu nền của Container
        borderRadius: BorderRadius.circular(6), // Bo góc
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Màu bóng mờ (đen mờ)
            spreadRadius: 5, // Độ lan rộng của bóng
            blurRadius: 10, // Độ mờ của bóng
            offset: const Offset(0, 3), // Vị trí của bóng (trục x, trục y)
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            number,
            style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )
        ],
      ),
    );
  }

  Padding _textResult(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
            child: Text(text),
          ),
        ],
      ),
    );
  }

  Padding _verticalDivider() {
    return const Padding(
      padding: EdgeInsets.only(top: 4),
      child: VerticalDivider(
        width: 1, // Chiều rộng của đường kẻ
        thickness: 1, // Độ dày của đường kẻ
        color: Colors.grey, // Màu sắc của đường kẻ
      ),
    );
  }

  Widget _currentSeason(String name, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
            Text(
              number,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _sizeBoxW4() {
    return const SizedBox(
      width: 8,
    );
  }
}
