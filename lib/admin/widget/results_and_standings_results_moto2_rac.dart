// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/moto2_view_model.dart';
import 'results_and_standings_list_view.dart';

class ResultsAndStandingsResultsMoto2Rac extends StatefulWidget {
  const ResultsAndStandingsResultsMoto2Rac({super.key});

  @override
  State<ResultsAndStandingsResultsMoto2Rac> createState() =>
      _ResultsAndStandingsResultsMoto2RacState();
}

class _ResultsAndStandingsResultsMoto2RacState
    extends State<ResultsAndStandingsResultsMoto2Rac> {
  @override
  Widget build(BuildContext context) {
    final controllerRiders = Get.put(Moto2ViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMoto2Official(),
              controllerRiders.fetchRidersMoto2Substitute(),
              controllerRiders.fetchRidersMoto2WildcardsAndTestRiders(),
              controllerRiders.fetchResultMoto2RAC(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Column(
                    children: [
                      _textInfomation(),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controllerRiders.resultsMoto2RAC.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverListResults(
                    controller: controllerRiders,
                    listDS: controllerRiders.resultsMoto2RAC,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textInfomation() {
    return Stack(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white, // Màu nền của Container
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow offset
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _textHeaderBlack('Pos.'),
                const SizedBox(
                  width: 85,
                ),
                _textHeaderGrey('Pts'),
                const SizedBox(
                  width: 360,
                ),
                _textHeaderBlack('Rider'),
                const SizedBox(
                  width: 360,
                ),
                _textHeaderGrey('Team'),
                const SizedBox(
                  width: 690,
                ),
                _textHeaderBlack('Time/Gap'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text _textHeaderBlack(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }

  Text _textHeaderGrey(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.grey),
    );
  }
}
