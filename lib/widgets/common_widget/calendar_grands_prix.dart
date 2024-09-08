import 'package:flutter/material.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';

class CalendarGrandsPrix extends StatefulWidget {
  const CalendarGrandsPrix({super.key});

  @override
  State<CalendarGrandsPrix> createState() => _CalendarGrandsPrixState();
}

class _CalendarGrandsPrixState extends State<CalendarGrandsPrix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Column(
            children: [
              _grandsPrixMonth('March'),
              _sizeboxH20(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    padding: EdgeInsets.symmetric(horizontal: 64),
                    decoration: BoxDecoration(
                      color: Colors.white, // Màu nền của Container
                      borderRadius: BorderRadius.circular(6), // Bo góc
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.2), // Màu bóng mờ (đen mờ)
                          spreadRadius: 5, // Độ lan rộng của bóng
                          blurRadius: 10, // Độ mờ của bóng
                          offset:
                              Offset(0, 3), // Vị trí của bóng (trục x, trục y)
                        ),
                      ],
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '8', //1
                              style: TextStyle(
                                  fontSize: 58,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            _sizeboxW20(),
                            Text(
                              '-', //1
                              style: TextStyle(
                                  fontSize: 58,
                                  color: const Color.fromARGB(255, 102, 94, 94),
                                  fontWeight: FontWeight.bold),
                            ),
                            _sizeboxW20(),
                            Text(
                              '10', //1
                              style: TextStyle(
                                  fontSize: 58,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 46,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quatar Airways Grand Prix of Quatar', //1
                                  style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      ImageAssest.qutar,
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Lusail International Circuit',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    )
                                  ],
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
                    child: Image.asset(
                      ImageAssest.grandsGP1,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 94,
                    left: 175,
                    child: Text(
                      'MAR', //2
                      style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 75, 73, 73),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 94,
                    left: 68,
                    child: Text(
                      'MAR', //2
                      style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 75, 73, 73),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    left: 45,
                    child: Container(
                      width: 160, // Chiều rộng container nhỏ
                      height: 32, // Chiều cao container nhỏ
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft, // Bắt đầu từ bên trái
                          end: Alignment.centerRight, // Kết thúc ở bên phải
                          colors: [
                            Color.fromARGB(255, 180, 41, 31), // Màu bên trái
                            Colors.black, // Màu bên phải
                          ],
                        ),
                        borderRadius: BorderRadius.circular(
                            7), // Bo góc cho Container nhỏ
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '  GP1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              child: VerticalDivider(
                                width: 1, // Chiều rộng của đường kẻ
                                thickness: 2, // Độ dày của đường kẻ
                                color: Colors.grey, // Màu sắc của đường kẻ
                              ),
                            ),
                            Text(
                              'Finished  ',
                              style: TextStyle(
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
              _sizeboxH20(),
              _grandsPrixMonth('April'),
              _sizeboxH20(),
              _grandsPrixMonth('May'),
              _sizeboxH20(),
              _grandsPrixMonth('June'),
              _sizeboxH20(),
              _grandsPrixMonth('July'),
              _sizeboxH20(),
              _grandsPrixMonth('August'),
              _sizeboxH20(),
              _grandsPrixMonth('September'),
              _sizeboxH20(),
              _grandsPrixMonth('October'),
              _sizeboxH20(),
              _grandsPrixMonth('November'),
              _sizeboxH20(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _sizeboxW20() {
    return const SizedBox(
      width: 20,
    );
  }

  SizedBox _sizeboxH20() => const SizedBox(
        height: 20,
      );

  Row _grandsPrixMonth(String text) {
    return Row(
      children: [
        Image.asset(
          ImageAssest.redFlag,
          height: 44,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
