import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common_widget/grid_view_teams.dart';

import '../../view_model/riders_and_teams_teams_moto2_view_model.dart';

class RidersAndTeamsTeamsMoto2 extends StatefulWidget {
  const RidersAndTeamsTeamsMoto2({super.key});

  @override
  State<RidersAndTeamsTeamsMoto2> createState() =>
      _RidersAndTeamsTeamsMoto2State();
}

class _RidersAndTeamsTeamsMoto2State extends State<RidersAndTeamsTeamsMoto2> {
  @override
  Widget build(BuildContext context) {
    final controllerRiders = Get.put(RidersAndTeamsTeamsMoto2ViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMoto2(),
              controllerRiders.fetchRidersMoto2Substitute(),
              controllerRiders.fetchRidersMoto2WildCardsAndTestRiders(),
              controllerRiders.fetchTeamsMoto2(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header

              Obx(() {
                if (controllerRiders.teamsMoto2.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GridViewTeams(
                    controller: controllerRiders,
                    listDS: controllerRiders.teamsMoto2,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
