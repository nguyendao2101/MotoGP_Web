import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  String selectEvent = 'GRAN PREMIO DI SAN MARINO E DELLA RIVIERA DI RIMINI';
  String selectedMoto = 'motogp'; // Giá trị chọn của Dropdown 1
  String selectedRacWup = 'RAC'; // Giá trị chọn của Dropdown 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              DropdownButton<int>(
                value: selectedYear,
                items: [2024, 2023, 2022, 2021, 2020].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    selectedYear = newValue!;
                  });
                },
              ),
              SizedBox(width: 20), // Khoảng cách
              DropdownButton<String>(
                value: selectedType,
                items: ['Grands Prix', 'All Events'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.toUpperCase()),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedType = newValue!;
                  });
                },
              ),
              SizedBox(width: 20), // Khoảng cách
              DropdownButton<String>(
                value: selectEvent,
                items: [
                  'GRAN PREMIO DI SAN MARINO E DELLA RIVIERA DI RIMINI',
                  'TT ASEN',
                  'GRAN PREMI DE CATALUNYA'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectEvent = newValue!;
                  });
                },
              ),
              SizedBox(width: 20), // Khoảng cách
              DropdownButton<String>(
                value: selectedMoto,
                items:
                    ['motogp', 'moto2', 'moto3', 'motoe'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.toUpperCase()),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedMoto = newValue!;
                  });
                },
              ),
              SizedBox(width: 20), // Khoảng cách giữa các Dropdown
              DropdownButton<String>(
                value: selectedRacWup,
                items: ['RAC', 'WUP'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRacWup = newValue!;
                  });
                },
              ),
              SizedBox(width: 20), // Khoảng cách
              ElevatedButton(
                onPressed: () {
                  if (selectedMoto == 'motogp' && selectedRacWup == 'WUP') {
                    Get.to(ResultScreen(
                        moto: selectedMoto, racWup: selectedRacWup));
                  }
                },
                child: Text('Go'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('Please select options'),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String moto;
  final String racWup;

  ResultScreen({required this.moto, required this.racWup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Center(
        child: Text('You selected: $moto and $racWup'),
      ),
    );
  }
}
