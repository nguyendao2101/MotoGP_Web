import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/view/calendar_view.dart';
import 'package:moto_gp_web/view/news_view.dart';
import 'package:moto_gp_web/view/results_and_standings_view.dart';
import 'package:moto_gp_web/view/riders_and_teams_view.dart';
import 'package:moto_gp_web/view/video_pass_view.dart';
import 'package:moto_gp_web/view/videos_view.dart';
import 'package:moto_gp_web/view_model/home_screen_view_model.dart';
import 'package:moto_gp_web/widgets/common/color_extentionn.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';
import 'package:moto_gp_web/widgets/common_widget/icon_text_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 6 tabs and the current index set to 0
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenViewModel());
    var media = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        key: controller.scaffoldKey,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 180,
                child: DrawerHeader(
                  decoration:
                      BoxDecoration(color: ChatColor.gray6.withOpacity(0.03)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        ImageAssest.logoappMoto,
                        width: media.width * 0.1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              IconTextRow(title: 'Calendar', onTap: controller.closeDrawer),
              _dividerDrawer(),
              IconTextRow(title: 'Results', onTap: controller.closeDrawer),
              _dividerDrawer(),
              IconTextRow(title: 'Standings', onTap: controller.closeDrawer),
              _dividerDrawer(),
              IconTextRow(
                  title: 'Riders & Team', onTap: controller.closeDrawer),
              _dividerDrawer(),
              IconTextRow(title: 'VideoPass', onTap: controller.closeDrawer),
              _dividerDrawer(),
              IconTextRow(title: 'Videos', onTap: controller.closeDrawer),
              _dividerDrawer(),
              IconTextRow(title: 'News', onTap: controller.closeDrawer),
              _dividerDrawer(),
              IconTextRow(title: 'Game Hub', onTap: controller.closeDrawer),
              _dividerDrawer(),
              IconTextRow(
                  title: 'Racing For the Future',
                  onTap: controller.closeDrawer),
              _dividerDrawer(),
              IconTextRow(title: 'More Racing', onTap: controller.closeDrawer),
              _dividerDrawer(),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 120, // Chiều cao tùy chỉnh cho AppBar
          title: SizedBox(
            height: 120,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _textTopAppbar('#RacingForTheFuture'),
                        _SizeBoxW24(),
                        _textTopAppbar('Tickets'),
                        _SizeBoxW24(),
                        _textTopAppbar('Hospitality'),
                        _SizeBoxW24(),
                        _textTopAppbar('Experiences'),
                        _SizeBoxW24(),
                        _textTopAppbar('Store'),
                        _SizeBoxW24(),
                        _textTopAppbar('Authentics'),
                        _SizeBoxW24(),
                        _richTextTopAppbar('MotorGP™', 'TIMINGPASS'),
                        _SizeBoxW24(),
                        _richTextTopAppbar('MotorGP™', 'VIDEOPASS'),
                        _SizeBoxW24(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          child: const Text('SUBSCRIBE'),
                        ),
                        _SizeBoxW24(),
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: VerticalDivider(
                            width: 1, // Chiều rộng của đường kẻ
                            thickness: 2, // Độ dày của đường kẻ
                            color: Colors.grey, // Màu sắc của đường kẻ
                          ),
                        ),
                        _SizeBoxW24(),
                        Image.asset(
                          ImageAssest.logoWebMoto,
                          height: 160,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 48),
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: Colors.red,
                            indicatorWeight: 1,
                            labelColor: Colors.white,
                            labelStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            isScrollable: true,
                            tabs: const [
                              Tab(text: 'Calendar'),
                              Tab(text: 'Results & Standings'),
                              Tab(text: 'Riders & Team'),
                              Tab(text: 'VideoPass'),
                              Tab(text: 'Videos'),
                              Tab(text: 'News'),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left:
                            0, // Hoặc left: 0 nếu bạn muốn hình ảnh nằm bên trái
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            ImageAssest.logoMotoGP,
                            height: 60,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 14,
                        right:
                            0, // Hoặc left: 0 nếu bạn muốn hình ảnh nằm bên trái
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            ImageAssest.user,
                            height: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF3D0000)], // Các màu gradient
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            CalendarView(),
            ResultsAndStandingsView(),
            RidersAndTeamsView(),
            VideoPassView(),
            VideosView(),
            NewsView(),
          ],
        ),
      ),
    );
  }

  Padding _dividerDrawer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Divider(
        thickness: 0.5,
        color: Colors.grey[400],
      ),
    );
  }

  RichText _richTextTopAppbar(String text, String textt) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              color: ChatColor.gray7, // Màu chữ
              fontWeight: FontWeight.bold, // Đậm
              fontSize: 12, // Kích thước chữ
            ),
          ),
          TextSpan(
            text: textt,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold, // Màu chữ
              fontSize: 12, // Kích thước chữ
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _SizeBoxW24() {
    return const SizedBox(
      width: 24,
    );
  }

  Text _textTopAppbar(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 12, color: ChatColor.gray7),
    );
  }
}
