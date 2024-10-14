import 'package:flutter/material.dart';
import 'package:moto_gp_web/admin/view/results_and_standings_records_view.dart';
import 'package:moto_gp_web/admin/view/results_and_standings_results_view.dart';
import 'package:moto_gp_web/admin/view/results_and_standings_standings_view.dart';

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
            expandedHeight: 100, // Chiều cao tùy chỉnh cho AppBar khi mở rộng
            floating: true,
            snap: true,
            pinned:
                true, // Thay đổi thành true nếu bạn muốn giữ lại AppBar khi cuộn
            flexibleSpace: FlexibleSpaceBar(
              title: TabBar(
                controller: _tabController,
                indicatorColor: Colors.red,
                indicatorWeight: 0.5,
                labelColor: Colors.white,
                labelStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                isScrollable: true,
                tabs: const [
                  Tab(text: 'RESULTS'),
                  Tab(text: 'STANDINGS'),
                  Tab(text: 'RECORDS'),
                ],
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Color(0xFF3D0000)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
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
