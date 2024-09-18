import 'package:flutter/material.dart';

class ResultsAndStandingsRecordsView extends StatefulWidget {
  const ResultsAndStandingsRecordsView({super.key});

  @override
  State<ResultsAndStandingsRecordsView> createState() =>
      _ResultsAndStandingsRecordsViewState();
}

class _ResultsAndStandingsRecordsViewState
    extends State<ResultsAndStandingsRecordsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('records'),
      ),
    );
  }
}
