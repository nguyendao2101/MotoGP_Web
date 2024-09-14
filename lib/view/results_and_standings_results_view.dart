import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common_widget/results_and_standings_results_motogp_rac.dart';
import 'package:moto_gp_web/widgets/common_widget/results_and_standings_results_motogp_wup.dart';

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

  void _showYearDialog() async {
    final result = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Year'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [2024, 2023, 2022, 2021, 2020]
              .map((year) => ListTile(
                    title: Text(year.toString()),
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
        title: const Text('Select Type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Grands Prix', 'All Events']
              .map((type) => ListTile(
                    title: Text(type.toUpperCase()),
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
        title: const Text('Select Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'GRAN PREMIO DI SAN MARINO E DELLA RIVIERA DI RIMINI',
            'TT ASEN',
            'GRAN PREMI DE CATALUNYA'
          ]
              .map((event) => ListTile(
                    title: Text(event),
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
        title: const Text('Select Moto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['motogp', 'moto2', 'moto3', 'motoe']
              .map((moto) => ListTile(
                    title: Text(moto.toUpperCase()),
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
        title: const Text('Select RAC/WUP'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['RAC', 'WUP']
              .map((item) => ListTile(
                    title: Text(item),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: _showYearDialog,
                    child: Text('Year: $selectedYear'),
                  ),
                  const SizedBox(width: 20), // Khoảng cách

                  ElevatedButton(
                    onPressed: _showTypeDialog,
                    child: Text('Type: ${selectedType.toUpperCase()}'),
                  ),
                  const SizedBox(width: 20), // Khoảng cách

                  ElevatedButton(
                    onPressed: _showEventDialog,
                    child: Text('Event: $selectedEvent'),
                  ),
                  const SizedBox(width: 20), // Khoảng cách

                  ElevatedButton(
                    onPressed: _showMotoDialog,
                    child: Text('Moto: ${selectedMoto.toUpperCase()}'),
                  ),
                  const SizedBox(width: 20), // Khoảng cách

                  ElevatedButton(
                    onPressed: _showRaceOrWupDialog,
                    child: Text('Season: $selectedRaceOrWup'),
                  ),
                  const SizedBox(width: 20), // Khoảng cách

                  ElevatedButton(
                    onPressed: () {
                      if ((selectedMoto == 'motogp') &&
                          (selectedRaceOrWup == 'RAC')) {
                        Get.to(
                            () => const ResultsAndStandingsResultsMotogpRac());
                      }
                      if ((selectedMoto == 'motogp') &&
                          (selectedRaceOrWup == 'WUP')) {
                        Get.to(
                            () => const ResultsAndStandingsResultsMotogpWup());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: const Text('Go'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
