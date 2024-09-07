import 'package:flutter/material.dart';

class ResultsAndStandingsView extends StatefulWidget {
  const ResultsAndStandingsView({super.key});

  @override
  State<ResultsAndStandingsView> createState() =>
      _ResultsAndStandingsViewState();
}

class _ResultsAndStandingsViewState extends State<ResultsAndStandingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('results and standings'),
      ),
    );
  }
}
