import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/view_model/result_and_stadings_standings_moto3_view_model.dart';

import 'results_and_standings_stadings_list_view.dart';

class ResultsAndStandingsStadingsMoto3 extends StatefulWidget {
  const ResultsAndStandingsStadingsMoto3({super.key});

  @override
  State<ResultsAndStandingsStadingsMoto3> createState() =>
      _ResultsAndStandingsStadingsMoto3State();
}

class _ResultsAndStandingsStadingsMoto3State
    extends State<ResultsAndStandingsStadingsMoto3> {
  @override
  Widget build(BuildContext context) {
    final controllerRiders =
        Get.put(ResultAndStadingsStandingsMoto3ViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMoto3(),
              controllerRiders.fetchRidersMoto3Substitute(),
              controllerRiders.fetchRidersMoto3WildCardsAndTestRiders(),
              controllerRiders.fetchStandingsMoto3(),
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
                if (controllerRiders.standingsMoto3.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return ResultsAndStandingsStadingsListView(
                    controller: controllerRiders,
                    listDS: controllerRiders.standingsMoto3,
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
                  width: 380,
                ),
                _textHeaderBlack('Rider'),
                const SizedBox(
                  width: 460,
                ),
                _textHeaderGrey('Team'),
                const SizedBox(
                  width: 720,
                ),
                _textHeaderBlack('Points'),
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
      style: const TextStyle(fontSize: 20, color: Colors.black),
    );
  }

  Text _textHeaderGrey(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, color: Colors.grey),
    );
  }
}
