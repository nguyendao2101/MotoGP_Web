// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/view_model/calendar_view_model.dart';
import 'package:moto_gp_web/widgets/common_widget/calendar_all_events.dart';
import 'package:moto_gp_web/widgets/common_widget/calendar_grands_prix.dart';

import '../widgets/common_widget/calendar_all_events_fb.dart';
import '../widgets/common_widget/calendar_grands_prix_fb.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarViewModel());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140, // Chiều cao tối đa khi mở rộng
            pinned: false, // Giữ lại trên đầu khi cuộn lên
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 16.0),
              background: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Color(0xFF3D0000)
                        ], // Các màu gradient
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 72),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '2024 Calendar',
                            style: TextStyle(
                                fontSize: 48,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              title: null, // Không hiển thị tiêu đề khi kéo xuống
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.red,
              indicatorWeight: 1,
              labelColor: Colors.red,
              labelStyle:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              isScrollable: true,
              tabs: const [
                Tab(text: 'Grands Prix'),
                Tab(text: 'All Events'),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const [
                CalendarGrandsPrixFb(),
                CalendarAllEventsFb(),
                // CalendarGrandsPrix(),
                // CalendarAllEvents(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
