import 'package:flutter/material.dart';

class ResultsAndStandingsStandingsView extends StatefulWidget {
  const ResultsAndStandingsStandingsView({super.key});

  @override
  State<ResultsAndStandingsStandingsView> createState() =>
      _ResultsAndStandingsStandingsViewState();
}

class _ResultsAndStandingsStandingsViewState
    extends State<ResultsAndStandingsStandingsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('standings'),
      ),
    );
  }
}
