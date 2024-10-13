import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/riders_and_teams_teams_motoe_view_model.dart';
import 'grid_view_teams.dart';

class RidersAndTeamsTeamsMotoE extends StatefulWidget {
  const RidersAndTeamsTeamsMotoE({super.key});

  @override
  State<RidersAndTeamsTeamsMotoE> createState() =>
      _RidersAndTeamsTeamsMotoEState();
}

class _RidersAndTeamsTeamsMotoEState extends State<RidersAndTeamsTeamsMotoE> {
  @override
  Widget build(BuildContext context) {
    final controllerRiders = Get.put(RidersAndTeamsTeamsMotoeViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMotoe(),
              controllerRiders.fetchTeamsMotoe(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header

              Obx(() {
                if (controllerRiders.teamsMotoe.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GridViewTeams(
                    controller: controllerRiders,
                    listDS: controllerRiders.teamsMotoe,
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
