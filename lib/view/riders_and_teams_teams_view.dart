import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/view_model/riders_and_teams_view_models.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_teams_moto2.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_teams_moto3.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_teams_motoe.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_teams_motogp.dart';

import '../widgets/common/image_extention.dart';

class RidersAndTeamsTeamsView extends StatefulWidget {
  const RidersAndTeamsTeamsView({super.key});

  @override
  State<RidersAndTeamsTeamsView> createState() =>
      _RidersAndTeamsTeamsViewState();
}

class _RidersAndTeamsTeamsViewState extends State<RidersAndTeamsTeamsView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 6x tabs and the current index set to 0
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(RidersAndTeamsViewModels());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: SizedBox(
          height: 50, // Đảm bảo có chiều cao cụ thể cho SizedBox
          child: Column(
            children: [
              // Thêm chiều cao cụ thể
              Expanded(
                  flex: 1,
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
                  )),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          RidersAndTeamsTeamsMotoGP(),
          RidersAndTeamsTeamsMoto2(),
          RidersAndTeamsTeamsMoto3(),
          RidersAndTeamsTeamsMotoE(),
        ],
      ),
    );
  }
}
