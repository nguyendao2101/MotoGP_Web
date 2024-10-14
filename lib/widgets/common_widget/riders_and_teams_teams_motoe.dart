import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/riders_and_teams_teams_motoe_view_model.dart';
import '../common/image_extention.dart';
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
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _grandsPrixMonth('Teams'),
                    ],
                  ),
                ),
              ),
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

  Row _grandsPrixMonth(String text) {
    return Row(
      children: [
        Image.asset(ImageAssest.redFlag, height: 44),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
