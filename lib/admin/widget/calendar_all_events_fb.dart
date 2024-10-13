import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/calendar_view_model.dart';
import '../../widgets/common/image_extention.dart';
import 'grand_prix_card.dart';

class CalendarAllEventsFb extends StatefulWidget {
  const CalendarAllEventsFb({super.key});

  @override
  State<CalendarAllEventsFb> createState() => _CalendarAllEventsFbState();
}

class _CalendarAllEventsFbState extends State<CalendarAllEventsFb> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchAllEventsFebruary(),
              controller.fetchAllEventsMarch(),
              controller.fetchAllEventsApril(),
              controller.fetchAllEventsMay(),
              controller.fetchAllEventsJune(),
              controller.fetchAllEventsJuly(),
              controller.fetchAllEventsAugust(),
              controller.fetchAllEventsSeptember(),
              controller.fetchAllEventsOctober(),
              controller.fetchAllEventsNovember(),
              controller.fetchAllEventsNovemberTest(),
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
                      _grandsPrixMonth('November'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsNovemberTest.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsNovemberTest,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('February'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsFebruary.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsFebruary,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('March'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsMarch.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsMarch,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('April'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsApril.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsApril,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('May'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsMay.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsMay,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('June'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsJune.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsJune,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('July'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsJuly.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsJuly,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('August'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsAugust.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsAugust,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('September'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsSeptember.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsSeptember,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('October'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsOctober.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsOctober,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('November'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsNovember.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsNovember,
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
