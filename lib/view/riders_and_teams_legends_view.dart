import 'package:flutter/material.dart';

import '../widgets/common/image_extention.dart';

class RidersAndTeamsLegendsView extends StatefulWidget {
  const RidersAndTeamsLegendsView({super.key});

  @override
  State<RidersAndTeamsLegendsView> createState() =>
      _RidersAndTeamsLegendsViewState();
}

class _RidersAndTeamsLegendsViewState extends State<RidersAndTeamsLegendsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: SizedBox(
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
      body: const Center(
        child: Text('legends'),
      ),
    );
  }
}
