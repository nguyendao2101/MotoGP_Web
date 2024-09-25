import 'package:flutter/material.dart';

class GrandPrixCard extends StatelessWidget {
  final String dayStart;
  final String space;

  final String dayEnd;
  final String grandPrixName;
  final String location;
  final String monthStart;
  final String monthEnd;

  final String gpNumber;
  final String raceStatus;
  final String grandCountry;

  final String grandPrixImage;

  const GrandPrixCard({
    super.key,
    required this.dayStart,
    required this.dayEnd,
    required this.grandPrixName,
    required this.location,
    required this.monthStart,
    required this.gpNumber,
    required this.raceStatus,
    required this.grandPrixImage,
    required this.grandCountry,
    required this.monthEnd,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                color: Colors.black.withOpacity(0.2), // Màu bóng mờ (đen mờ)
                spreadRadius: 5, // Độ lan rộng của bóng
                blurRadius: 10, // Độ mờ của bóng
                offset: const Offset(0, 3), // Vị trí của bóng (trục x, trục y)
              ),
            ],
          ),
          child: Row(
            children: [
              Text(
                dayStart,
                style: const TextStyle(
                    fontSize: 58,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              Text(
                space,
                style: const TextStyle(
                    fontSize: 58,
                    color: Color.fromARGB(255, 102, 94, 94),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              Text(
                dayEnd,
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
                    grandPrixName,
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        grandCountry,
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        location,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
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
            grandPrixImage,
            height: 140,
            width: 520,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 94,
          left: 206,
          child: Text(
            monthEnd,
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
            monthStart,
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
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  $gpNumber',
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
                    '$raceStatus  ',
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
    );
  }
}
