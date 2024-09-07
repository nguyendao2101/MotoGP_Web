import 'package:flutter/material.dart';

class RidersAndTeamsView extends StatefulWidget {
  const RidersAndTeamsView({super.key});

  @override
  State<RidersAndTeamsView> createState() => _RidersAndTeamsViewState();
}

class _RidersAndTeamsViewState extends State<RidersAndTeamsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('riders and teams'),
      ),
    );
  }
}
