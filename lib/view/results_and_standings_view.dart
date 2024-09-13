import 'package:flutter/material.dart';
import 'package:moto_gp_web/view/results_and_standings_records_view.dart';
import 'package:moto_gp_web/view/results_and_standings_results_view.dart';
import 'package:moto_gp_web/view/results_and_standings_standings_view.dart';

class ResultsAndStandingsView extends StatefulWidget {
  const ResultsAndStandingsView({super.key});

  @override
  State<ResultsAndStandingsView> createState() =>
      _ResultsAndStandingsViewState();
}

class _ResultsAndStandingsViewState extends State<ResultsAndStandingsView>
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 50, // Chiều cao tùy chỉnh cho AppBar khi mở rộng
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
                  height: 50,
                  child: Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TabBar(
                              controller: _tabController,
                              indicatorColor: Colors.red,
                              indicatorWeight: 1,
                              labelColor: Colors.white,
                              labelStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              isScrollable: true,
                              tabs: const [
                                Tab(text: 'RESULTS'),
                                Tab(text: 'STANDINGS'),
                                Tab(text: 'RECORDS'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ResultsAndStandingsResultsView(),
                ResultsAndStandingsStandingsView(),
                ResultsAndStandingsRecordsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
