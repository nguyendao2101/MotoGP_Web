import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/view_model/riders_and_teams_view_models.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_riders_moto2.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_riders_moto3.dart';
import 'package:moto_gp_web/widgets/common_widget/riders_and_teams_riders_motoE.dart';
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
    final controller = Get.put(RidersAndTeamsViewModels());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 210,
        title: SizedBox(
          height: 200, // Đảm bảo có chiều cao cụ thể cho SizedBox
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 100, // Đảm bảo Container có chiều cao xác định
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Image.asset(
                        ImageAssest.pannerRiders,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                  flex: 1,
                  child: SizedBox(height: 50)), // Thêm chiều cao cụ thể
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
          RidersAndTeamsRidersMotogp(),
          RidersAndTeamsRidersMoto2(),
          RidersAndTeamsRidersMoto3(),
          RidersAndTeamsRidersMotoe(),
        ],
      ),
    );
  }
}
