import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/admin/view/riders_and_teams_legends_view.dart';
import 'package:moto_gp_web/admin/view/riders_and_teams_riders_view.dart';
import 'package:moto_gp_web/admin/view/riders_and_teams_teams_view.dart';

import 'package:moto_gp_web/view_model/riders_and_teams_view_models.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';

import '../../widgets/common/color_extentionn.dart';

class RidersAndTeamsView extends StatefulWidget {
  const RidersAndTeamsView({super.key});

  @override
  State<RidersAndTeamsView> createState() => _RidersAndTeamsViewState();
}

class _RidersAndTeamsViewState extends State<RidersAndTeamsView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 3 tabs and the current index set to 0
    _tabController = TabController(length: 3, vsync: this);
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
            expandedHeight: 150, // Chiều cao tùy chỉnh cho AppBar khi mở rộng
            floating: true, // Giúp AppBar cuộn theo nội dung
            snap: true, // AppBar biến mất ngay khi vuốt nhẹ lên
            pinned: false, // AppBar không giữ lại khi cuộn
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
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
                child: SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, left: 80),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _textTopAppbar('Riders & Team'),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, right: 64),
                                child: Container(
                                  height: 64,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff292E4B),
                                    borderRadius: BorderRadius.circular(19),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      controller: controller.txtSearch.value,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 18.0),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            ImageAssest.search,
                                            height: 16,
                                          ),
                                        ),
                                        hintText: 'S E A R C H  R I D E R S',
                                        hintStyle: TextStyle(
                                          color: ChatColor.gray6,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TabBar(
                                  controller: _tabController,
                                  indicatorColor: Colors.red,
                                  indicatorWeight: 1,
                                  labelColor: Colors.white,
                                  labelStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  isScrollable: true,
                                  tabs: const [
                                    Tab(text: 'RIDERS'),
                                    Tab(text: 'TEAMS'),
                                    Tab(text: 'LEGENDS'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                const RidersAndTeamsRidersView(),
                const RidersAndTeamsTeamsView(),
                RidersAndTeamsLegendsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _textTopAppbar(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 44, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
