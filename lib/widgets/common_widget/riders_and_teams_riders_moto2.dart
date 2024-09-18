import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/view_model/moto2_view_model.dart';

import '../common/image_extention.dart';
import 'grid_view_raders.dart';

class RidersAndTeamsRidersMoto2 extends StatefulWidget {
  const RidersAndTeamsRidersMoto2({super.key});

  @override
  State<RidersAndTeamsRidersMoto2> createState() =>
      _RidersAndTeamsRidersMoto2State();
}

class _RidersAndTeamsRidersMoto2State extends State<RidersAndTeamsRidersMoto2> {
  final controller = Get.put(Moto2ViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchRidersMoto2Official(),
              controller.fetchRidersMoto2Substitute(),
              controller.fetchRidersMoto2WildcardsAndTestRiders(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('Official'),
                    ],
                  ),
                ),
              ),

              // SliverGrid for displaying riders
              Obx(() {
                if (controller.ridersListMoto2Official.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverGridRiders(
                    controller: controller,
                    listDS: controller.ridersListMoto2Official,
                  );
                }
              }),

              // Sliver footer
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('Wildcards And Test Riders'),
                    ],
                  ),
                ),
              ),

              Obx(
                () {
                  if (controller
                      .ridersListMoto2WildcardsAndTestRiders.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverGridRiders(
                      controller: controller,
                      listDS: controller.ridersListMoto2WildcardsAndTestRiders,
                    );
                  }
                },
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('Substitute'),
                    ],
                  ),
                ),
              ),

              Obx(
                () {
                  if (controller.ridersListMoto2Substitute.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverGridRiders(
                      controller: controller,
                      listDS: controller.ridersListMoto2Substitute,
                    );
                  }
                },
              ),
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
