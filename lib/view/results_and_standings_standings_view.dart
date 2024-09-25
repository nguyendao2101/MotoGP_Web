import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';
import 'package:moto_gp_web/widgets/common_widget/results_and_standings_stadings_moto2.dart';
import 'package:moto_gp_web/widgets/common_widget/results_and_standings_stadings_moto3.dart';
import 'package:moto_gp_web/widgets/common_widget/results_and_standings_stadings_motoe.dart';
import 'package:moto_gp_web/widgets/common_widget/results_and_standings_stadings_motogp.dart';

class ResultsAndStandingsStandingsView extends StatefulWidget {
  const ResultsAndStandingsStandingsView({super.key});

  @override
  State<ResultsAndStandingsStandingsView> createState() =>
      _ResultsAndStandingsStandingsViewState();
}

class _ResultsAndStandingsStandingsViewState
    extends State<ResultsAndStandingsStandingsView> {
  int selectedYear = 2024;
  String selectedChampionship = "RIDERS'CHAMPIONSHIP";
  String selectedCategory = 'MOTOGP';
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

  void _showChampionshipDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Select Championship',
          style: TextStyle(color: Color(0xFFBF2EF0), fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            "RIDERS'CHAMPIONSHIP",
            "TEAMS'CHAMPIONSHIP",
            "CONTRUCSTERS'CHAMPIONSHIP",
            "BMW M AWARD"
          ]
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
        selectedChampionship = result;
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
        selectedCategory = result;
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
                      onPressed: _showChampionshipDialog,
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
                                'Championship',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                selectedChampionship,
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
                                selectedCategory.toUpperCase(),
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
                  ],
                ),
                const SizedBox(height: 20),
                // Hiển thị widget dựa trên giá trị đã chọn
                ElevatedButton(
                  onPressed: () {
                    if (selectedCategory == 'motogp') {
                      Get.to(() => const ResultsAndStandingsStadingsMotogp());
                    }
                    if (selectedCategory == 'moto2') {
                      Get.to(() => const ResultsAndStandingsStadingsMoto2());
                    }
                    if (selectedCategory == 'moto3') {
                      Get.to(() => const ResultsAndStandingsStadingsMoto3());
                    }
                    if (selectedCategory == 'motoe') {
                      Get.to(() => const ResultsAndStandingsStadingsMotoe());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 138, 2, 2),
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
