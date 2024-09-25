// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';
import 'package:moto_gp_web/widgets/common_widget/results_and_standings_results_moto2_rac.dart';
import 'package:moto_gp_web/widgets/common_widget/results_and_standings_results_motogp_rac.dart';
import 'package:moto_gp_web/widgets/common_widget/results_and_standings_results_motogp_wup.dart';

import '../widgets/common_widget/results_and_standings_results_moto3_rac.dart';
import '../widgets/common_widget/results_and_standings_results_motoe_rac.dart';

class ResultsAndStandingsResultsView extends StatefulWidget {
  const ResultsAndStandingsResultsView({super.key});

  @override
  State<ResultsAndStandingsResultsView> createState() =>
      _ResultsAndStandingsResultsViewState();
}

class _ResultsAndStandingsResultsViewState
    extends State<ResultsAndStandingsResultsView> {
  int selectedYear = 2024;
  String selectedType = 'Grands Prix';
  String selectedEvent = 'GRAN PREMIO DI SAN MARINO E DELLA RIVIERA DI RIMINI';
  String selectedMoto = 'motogp';
  String selectedRaceOrWup = 'RAC';
  Widget? resultWidget;

  void _showYearDialog() async {
    final result = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Select Year',
          style: TextStyle(color: Color(0xFFBF2EF0), fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [2024, 2023, 2022, 2021, 2020]
              .map((year) => ListTile(
                    title: Text(
                      year.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onTap: () => Navigator.pop(context, year),
                  ))
              .toList(),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedYear = result;
      });
    }
  }

  void _showTypeDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Select Type',
          style: TextStyle(color: Color(0xFFBF2EF0), fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Grands Prix', 'All Events']
              .map((type) => ListTile(
                    title: Text(
                      type.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onTap: () => Navigator.pop(context, type),
                  ))
              .toList(),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedType = result;
      });
    }
  }

  void _showEventDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Select Event',
          style: TextStyle(color: Color(0xFFBF2EF0), fontSize: 20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'GRAN PREMIO DI SAN MARINO E DELLA RIVIERA DI RIMINI',
            'TT ASEN',
            'GRAN PREMI DE CATALUNYA'
          ]
              .map((event) => ListTile(
                    title: Text(
                      event,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onTap: () => Navigator.pop(context, event),
                  ))
              .toList(),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedEvent = result;
      });
    }
  }

  void _showMotoDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Select Category',
          style: TextStyle(color: Color(0xFFBF2EF0), fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['motogp', 'moto2', 'moto3', 'motoe']
              .map((moto) => ListTile(
                    title: Text(
                      moto.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onTap: () => Navigator.pop(context, moto),
                  ))
              .toList(),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedMoto = result;
      });
    }
  }

  void _showRaceOrWupDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Select Session',
          style: TextStyle(color: Color(0xFFBF2EF0), fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['RAC', 'WUP']
              .map((item) => ListTile(
                    title: Text(
                      item,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onTap: () => Navigator.pop(context, item),
                  ))
              .toList(),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedRaceOrWup = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            ImageAssest.backgroundResults,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: _showYearDialog,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize:
                            const Size(200, 100), // Đặt kích thước tối thiểu
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // This should work if the Row has enough width
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align column to start
                            children: [
                              const Text(
                                'Year',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                selectedYear.toString(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Image.asset(
                            ImageAssest.muiTen,
                            height: 16,
                            width: 16,
                          ),
                        ],
                      ),
                      // child: Text('Year: $selectedYear'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _showTypeDialog,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize:
                            const Size(200, 100), // Đặt kích thước tối thiểu
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // This should work if the Row has enough width
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align column to start
                            children: [
                              const Text(
                                'Type',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                selectedType.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Image.asset(
                            ImageAssest.muiTen,
                            height: 16,
                            width: 16,
                          ),
                        ],
                      ),
                      // child: Text('Type: ${selectedType.toUpperCase()}'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _showEventDialog,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize:
                            const Size(200, 100), // Đặt kích thước tối thiểu
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // This should work if the Row has enough width
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align column to start
                            children: [
                              const Text(
                                'Event',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                selectedEvent,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Image.asset(
                            ImageAssest.muiTen,
                            height: 16,
                            width: 16,
                          ),
                        ],
                      ),
                      // child: Text('Event: $selectedEvent'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _showMotoDialog,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize:
                            const Size(200, 100), // Đặt kích thước tối thiểu
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // This should work if the Row has enough width
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align column to start
                            children: [
                              const Text(
                                'Category',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                selectedMoto.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Image.asset(
                            ImageAssest.muiTen,
                            height: 16,
                            width: 16,
                          ),
                        ],
                      ),
                      // child: Text('Moto: ${selectedMoto.toUpperCase()}'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _showRaceOrWupDialog,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize: const Size(
                            200, 100), // Ensure button size is sufficient
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // This should work if the Row has enough width
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align column to start
                            children: [
                              const Text(
                                'Session',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                selectedRaceOrWup,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Image.asset(
                            ImageAssest.muiTen,
                            height: 16,
                            width: 16,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Hiển thị widget dựa trên giá trị đã chọn
                ElevatedButton(
                  onPressed: () {
                    if ((selectedMoto == 'motogp') &&
                        (selectedRaceOrWup == 'RAC')) {
                      Get.to(() => const ResultsAndStandingsResultsMotogpRac());
                    }
                    if ((selectedMoto == 'motogp') &&
                        (selectedRaceOrWup == 'WUP')) {
                      Get.to(() => const ResultsAndStandingsResultsMotogpWup());
                    }
                    if ((selectedMoto == 'moto2') &&
                        (selectedRaceOrWup == 'RAC')) {
                      Get.to(() => const ResultsAndStandingsResultsMoto2Rac());
                    }
                    if ((selectedMoto == 'moto3') &&
                        (selectedRaceOrWup == 'RAC')) {
                      Get.to(() => const ResultsAndStandingsResultsMoto3Rac());
                    }
                    if ((selectedMoto == 'motoe') &&
                        (selectedRaceOrWup == 'RAC')) {
                      Get.to(() => const ResultsAndStandingsResultsMotoeRac());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 138, 2, 2),
                    minimumSize:
                        const Size(200, 100), // Đặt kích thước tối thiểu
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Go',
                    style: TextStyle(fontSize: 24), // Tăng kích thước chữ
                  ),
                ),

                const SizedBox(
                  height: 420,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
