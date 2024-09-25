import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';
import '../../view/results_and_standings_view.dart';
import '../../view/riders_and_teams_riders_view.dart';

class RiderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> rider;

  const RiderDetailScreen({super.key, required this.rider});

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
                                  height: 250,
                                  width: 200,
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
                                    rider['Team'],
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
                            width: 450,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  _currentSeason(
                                      'POSITION', rider['Position'].toString()),
                                  _verticalDivider(),
                                  _currentSeason(
                                      'POINTS', rider['Points'].toString()),
                                  _verticalDivider(),
                                  _currentSeason('VICTORIES',
                                      rider['Victories'].toString()),
                                ],
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
                                'Current Season',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 630,
                          left: 195,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const ResultsAndStandingsView());
                            },
                            child: Row(
                              children: [
                                const Text(
                                  'R E S U L T   &   S T A N D I N G S',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Image.asset(
                                  ImageAssest.sangNgang,
                                  height: 16,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 700,
                          left: 70,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const RidersAndTeamsRidersView());
                            },
                            child: Container(
                              height: 110,
                              width: 450,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 39, 33, 33),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 50, // Độ rộng của Container
                                            height: 50, // Độ cao của Container
                                            child: Image.network(
                                              rider['TeamMateImage'], // URL ảnh
                                              fit: BoxFit
                                                  .cover, // Đảm bảo ảnh phóng to và lấp đầy
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'TEAMMATE',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              rider['TeamMateName'],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Image.asset(
                                      ImageAssest.sangNgang,
                                      height: 20,
                                    )
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
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 50, bottom: 20),
              child: Row(
                children: [
                  Image.asset(ImageAssest.redFlag, height: 44),
                  const Text(
                    'Rider Stats',
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
            _textResult('MOTOGP'),
            _rowResultsMotoGP(),
            _textResult('MOTO2'),
            _rowResultsMoto2(),
            _textResult('MOTO3'),
            _rowResultsMoto3(),
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
              'POLES', zeroToS(rider['TotalPoles']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'RACES', zeroToS(rider['TotalRaces']).toString()),
        ],
      ),
    );
  }

  Padding _rowResultsMotoGP() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _containerResultDetail('WORLD CHAMPIONSHIPS',
              zeroToS(rider['MotoGPWorldChampionships']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'VICTORIES', zeroToS(rider['MotoGPVictories']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'PODIUMS', zeroToS(rider['MotoGPPodiums']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'POLES', zeroToS(rider['MotoGPPoles']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'RACES', zeroToS(rider['MotoGPRaces']).toString()),
        ],
      ),
    );
  }

  Padding _rowResultsMoto2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _containerResultDetail('WORLD CHAMPIONSHIPS',
              zeroToS(rider['Moto2WorldChampionships']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'VICTORIES', zeroToS(rider['Moto2Victories']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'PODIUMS', zeroToS(rider['Moto2Podiums']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'POLES', zeroToS(rider['Moto2Poles']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'RACES', zeroToS(rider['Moto2Races']).toString()),
        ],
      ),
    );
  }

  Padding _rowResultsMoto3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _containerResultDetail('WORLD CHAMPIONSHIPS',
              zeroToS(rider['Moto3WorldChampionships']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'VICTORIES', zeroToS(rider['Moto3Victories']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'PODIUMS', zeroToS(rider['Moto3Podiums']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'POLES', zeroToS(rider['Moto3Poles']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'RACES', zeroToS(rider['Moto3Races']).toString()),
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
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            number,
            style: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }

  SizedBox _sizeBoxW4() {
    return const SizedBox(
      width: 8,
    );
  }
}
