import 'package:flutter/material.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';

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
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.blueAccent.withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Main content
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 900,
            child: Container(
              width: double.infinity, // Chiều rộng đầy đủ
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Stack(
                children: [
                  // Hình ảnh của rider
                  Positioned.fill(
                    top: 100,
                    right: -800,
                    child: rider['ImageRacer'] != ''
                        ? Image.network(
                            rider['ImageRacer'],
                            height:
                                250, // Đảm bảo hình ảnh không quá cao so với chiều cao của container
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
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
                    top: 600,
                    left: 80,
                    child: Container(
                      height: 130,
                      width: 460,
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
                            _currentSeason(
                                'VICTORIES', rider['Victories'].toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 550,
                    left: 80,
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
                  )
                ],
              ),
            ),
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
