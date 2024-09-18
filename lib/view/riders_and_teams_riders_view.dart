// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/view_model/riders_and_teams_view_models.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_riders_moto2.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_riders_moto3.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_riders_motoe.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_riders_motogp.dart';

class RidersAndTeamsRidersView extends StatefulWidget {
  const RidersAndTeamsRidersView({super.key});

  @override
  State<RidersAndTeamsRidersView> createState() =>
      _RidersAndTeamsRidersViewState();
}

class _RidersAndTeamsRidersViewState extends State<RidersAndTeamsRidersView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 4 tabs
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RidersAndTeamsViewModels());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true, // Giúp AppBar cuộn theo nội dung
            snap: true, // AppBar xuất hiện ngay khi người dùng vuốt nhẹ lên
            pinned: false, // Không giữ lại AppBar khi cuộn
            primary: false, // Vô hiệu hóa việc tính toán AppBar với phần đầu
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              background: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.red,
                        indicatorWeight: 1,
                        labelColor: Colors.red,
                        labelStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        isScrollable: true,
                        tabs: const [
                          Tab(text: 'MotoGP™'),
                          Tab(text: 'Moto2™'),
                          Tab(text: 'Moto3™'),
                          Tab(text: 'MotoE™'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                RidersAndTeamsRidersMotogp(),
                const RidersAndTeamsRidersMoto2(),
                const RidersAndTeamsRidersMoto3(),
                const RidersAndTeamsRidersMotoe(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
