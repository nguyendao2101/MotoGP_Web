import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/moto3_view_model.dart';
import '../common/image_extention.dart';
import 'grid_view_raders.dart';

class RidersAndTeamsRidersMoto3 extends StatefulWidget {
  const RidersAndTeamsRidersMoto3({super.key});

  @override
  State<RidersAndTeamsRidersMoto3> createState() =>
      _RidersAndTeamsRidersMoto3State();
}

class _RidersAndTeamsRidersMoto3State extends State<RidersAndTeamsRidersMoto3> {
  final controller = Get.put(Moto3ViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchRidersMoto3Official(),
              controller.fetchRidersMoto3Substitute(),
              controller.fetchRidersMoto3WildcardsAndTestRiders(),
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
                if (controller.ridersListMoto3Official.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverGridRiders(
                    controller: controller,
                    listDS: controller.ridersListMoto3Official,
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
                      .ridersListMoto3WildcardsAndTestRiders.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverGridRiders(
                      controller: controller,
                      listDS: controller.ridersListMoto3WildcardsAndTestRiders,
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
                  if (controller.ridersListMoto3Substitute.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverGridRiders(
                      controller: controller,
                      listDS: controller.ridersListMoto3Substitute,
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
