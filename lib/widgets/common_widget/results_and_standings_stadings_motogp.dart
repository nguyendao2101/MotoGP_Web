import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/result_and_stadings_standings_motogp_view_model.dart';
import 'results_and_standings_stadings_list_view.dart';

class ResultsAndStandingsStadingsMotogp extends StatefulWidget {
  const ResultsAndStandingsStadingsMotogp({super.key});

  @override
  State<ResultsAndStandingsStadingsMotogp> createState() =>
      _ResultsAndStandingsStadingsMotogpState();
}

class _ResultsAndStandingsStadingsMotogpState
    extends State<ResultsAndStandingsStadingsMotogp> {
  @override
  Widget build(BuildContext context) {
    final controllerRiders =
        Get.put(ResultAndStadingsStandingsMotogpViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMotoGP(),
              controllerRiders.fetchRidersMotoGPSubstitute(),
              controllerRiders.fetchRidersMotoGPWildCardsAndTestRiders(),
              controllerRiders.fetchStandingsMotoGP(),
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
                if (controllerRiders.standingsMotoGP.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return ResultsAndStandingsStadingsListView(
                    controller: controllerRiders,
                    listDS: controllerRiders.standingsMotoGP,
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
