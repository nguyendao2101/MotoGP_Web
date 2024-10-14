import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/riders_and_teams_teams_moto3_view_model.dart';
import 'grid_view_teams.dart';

class RidersAndTeamsTeamsMoto3 extends StatefulWidget {
  const RidersAndTeamsTeamsMoto3({super.key});

  @override
  State<RidersAndTeamsTeamsMoto3> createState() =>
      _RidersAndTeamsTeamsMoto3State();
}

class _RidersAndTeamsTeamsMoto3State extends State<RidersAndTeamsTeamsMoto3> {
  @override
  Widget build(BuildContext context) {
    final controllerRiders = Get.put(RidersAndTeamsTeamsMoto3ViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMoto3(),
              controllerRiders.fetchRidersMoto3Substitute(),
              controllerRiders.fetchRidersMoto3WildCardsAndTestRiders(),
              controllerRiders.fetchTeamsMoto3(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header

              Obx(() {
                if (controllerRiders.teamsMoto3.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GridViewTeams(
                    controller: controllerRiders,
                    listDS: controllerRiders.teamsMoto3,
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
