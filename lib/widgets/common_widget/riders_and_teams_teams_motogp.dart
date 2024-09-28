import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/riders_and_teams_teams_motogp_view_model.dart';
import 'grid_view_teams.dart';
import 'results_and_standings_stadings_list_view.dart';

class RidersAndTeamsTeamsMotoGP extends StatefulWidget {
  const RidersAndTeamsTeamsMotoGP({super.key});

  @override
  State<RidersAndTeamsTeamsMotoGP> createState() =>
      _RidersAndTeamsTeamsMotoGPState();
}

class _RidersAndTeamsTeamsMotoGPState extends State<RidersAndTeamsTeamsMotoGP> {
  @override
  Widget build(BuildContext context) {
    final controllerRiders = Get.put(RidersAndTeamsTeamsMotogpViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMotoGP(),
              controllerRiders.fetchRidersMotoGPSubstitute(),
              controllerRiders.fetchRidersMotoGPWildCardsAndTestRiders(),
              controllerRiders.fetchTeamsMotoGP(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header

              Obx(() {
                if (controllerRiders.teamsMotoGP.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GridViewTeams(
                    controller: controllerRiders,
                    listDS: controllerRiders.teamsMotoGP,
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
