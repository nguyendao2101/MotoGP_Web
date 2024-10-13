import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:moto_gp_web/view_model/riders_and_teams_view_models.dart';

import 'list_view_results_motogp_wup.dart';

class ResultsAndStandingsResultsMotogpWup extends StatelessWidget {
  const ResultsAndStandingsResultsMotogpWup({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerRiders = Get.put(RidersAndTeamsViewModels());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMotoGP(),
              controllerRiders.fetchRidersMotoGPSubstitute(),
              controllerRiders.fetchRidersMotoGPWildCardsAndTestRiders(),
              controllerRiders.fetchResultMotoGPWUP(),
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
                if (controllerRiders.ridersListMotoGP.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  print('hello');
                  return SliverListResultsMotoGPWUP(
                    controller: controllerRiders,
                    listDS: controllerRiders.resultsMotoGPWUP,
                  );
                  // return Center(
                  //   child: Text(
                  //     'hello',
                  //     style: TextStyle(fontSize: 30, color: Colors.black),
                  //   ),
                  // );
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
                  width: 360,
                ),
                _textHeaderBlack('Rider'),
                const SizedBox(
                  width: 360,
                ),
                _textHeaderGrey('Team'),
                const SizedBox(
                  width: 660,
                ),
                _textHeaderGrey('Gap 1st/Prev.	'),
                const SizedBox(
                  width: 40,
                ),
                _textHeaderBlack('Time'),
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
