import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../view_model/pdf_motogp.dart';
import 'table_standings_detail.dart';

class TableStadingsMotogp extends StatefulWidget {
  const TableStadingsMotogp({super.key});

  @override
  State<TableStadingsMotogp> createState() => _TableStadingsMotogpState();
}

class _TableStadingsMotogpState extends State<TableStadingsMotogp> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PdfMotogp());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchRidersMotoGP(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header

              Obx(() {
                if (controller.ridersMotoGP.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return TableStandingsDetail(
                    controller: controller,
                    listDS: controller.ridersMotoGP,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
