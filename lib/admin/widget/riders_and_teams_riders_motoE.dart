// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/motoe_view_model.dart';
import '../../widgets/common/image_extention.dart';
import 'grid_view_raders.dart';

class RidersAndTeamsRidersMotoe extends StatefulWidget {
  const RidersAndTeamsRidersMotoe({super.key});

  @override
  State<RidersAndTeamsRidersMotoe> createState() =>
      _RidersAndTeamsRidersMotoeState();
}

class _RidersAndTeamsRidersMotoeState extends State<RidersAndTeamsRidersMotoe> {
  final controller = Get.put(MotoeViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchRidersMotoEOfficial(),
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
                if (controller.ridersListMotoEOfficial.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverGridRiders(
                    controller: controller,
                    listDS: controller.ridersListMotoEOfficial,
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
