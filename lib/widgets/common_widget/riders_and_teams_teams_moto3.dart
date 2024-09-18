import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/moto3_view_model.dart';

class RidersAndTeamsTeamsMoto3 extends StatefulWidget {
  const RidersAndTeamsTeamsMoto3({super.key});

  @override
  State<RidersAndTeamsTeamsMoto3> createState() =>
      _RidersAndTeamsTeamsMoto3State();
}

class _RidersAndTeamsTeamsMoto3State extends State<RidersAndTeamsTeamsMoto3> {
  final controller = Get.put(Moto3ViewModel());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('moto3'),
      ),
    );
  }
}
