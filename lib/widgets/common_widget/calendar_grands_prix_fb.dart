import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../view_model/calendar_view_model.dart';
import '../common/image_extention.dart';
import 'grand_prix_card.dart';

class CalendarGrandsPrixFb extends StatefulWidget {
  const CalendarGrandsPrixFb({super.key});

  @override
  State<CalendarGrandsPrixFb> createState() => _CalendarGrandsPrixFbState();
}

class _CalendarGrandsPrixFbState extends State<CalendarGrandsPrixFb> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchGrandsPrixMarch(),
              controller.fetchGrandsPrixApril(),
              controller.fetchGrandsPrixMay(),
              controller.fetchGrandsPrixJune(),
              controller.fetchGrandsPrixJuly(),
              controller.fetchGrandsPrixAugust(),
              controller.fetchGrandsPrixSeptember(),
              controller.fetchGrandsPrixOctober(),
              controller.fetchGrandsPrixNovember(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('March'),
                      // InkWell(
                      //   onTap: () {
                      //     _showInputDialog(context);
                      //   },
                      //   child: Row(
                      //     children: [
                      //       Image.asset(
                      //         ImageAssest.add,
                      //         height: 48,
                      //       ),
                      //       const Text(
                      //         'Add Calendar',
                      //         style: TextStyle(
                      //             fontSize: 30,
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.grandsPrixMarch.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.grandsPrixMarch,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('April'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.grandsPrixApril.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.grandsPrixApril,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('May'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.grandsPrixMay.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.grandsPrixMay,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('June'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.grandsPrixJune.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.grandsPrixJune,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('July'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.grandsPrixJuly.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.grandsPrixJuly,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('August'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.grandsPrixAugust.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.grandsPrixAugust,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('September'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.grandsPrixSeptember.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.grandsPrixSeptember,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('October'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.grandsPrixOctober.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.grandsPrixOctober,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('November'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.grandsPrixNovember.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.grandsPrixNovember,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _grandsPrixMonth(String text) {
    return Row(
      children: [
        Image.asset(ImageAssest.redFlag, height: 44),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // void _showInputDialog(BuildContext context) {
  //   final _formKey = GlobalKey<FormState>();
  //   String Category = '';
  //   String DayEnd = '';
  //   String DayStart = '';
  //   String EventName = '';
  //   String Image = '';
  //   String ImageCountry = '';
  //   String ImageDetail = '';
  //   String Location = '';
  //   String MonthEnd = '';
  //   String MonthStart = '';
  //   String Status = '';

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Add Information calendar'),
  //         content: Form(
  //           key: _formKey,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'Category'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add Category';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   Category = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'DayStart'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add DayStart';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   DayStart = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'DayEnd'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add DayEnd';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   DayEnd = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'MonthStart'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add MonthStart';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   MonthStart = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'MonthEnd'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add MonthEnd';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   MonthEnd = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'Status'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add Status';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   Status = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'EventName'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add EventName';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   EventName = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'Location'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add Location';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   Location = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'ImageDetail'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add Image';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   Image = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'Image'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add ImageCountry';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   ImageCountry = value;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: const InputDecoration(labelText: 'ImageCountry'),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Add ImageDetail';
  //                   }
  //                   return null;
  //                 },
  //                 onChanged: (value) {
  //                   ImageDetail = value;
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Đóng dialog
  //             },
  //             child: const Text('Hủy'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               if (_formKey.currentState!.validate()) {
  //                 // Xử lý thông tin nhập vào
  //                 print('da nhan: ${Category}');
  //                 print('da nhan: ${DayStart}');
  //                 print('da nhan: ${DayEnd}');
  //                 print('da nhan: ${EventName}');
  //                 print('da nhan: ${Image}');
  //                 print('da nhan: ${ImageCountry}');
  //                 print('da nhan: ${ImageDetail}');
  //                 print('da nhan: ${Location}');
  //                 print('da nhan: ${MonthEnd}');
  //                 print('da nhan: ${MonthStart}');
  //                 print('da nhan: ${Status}');

  //                 Navigator.of(context).pop(); // Đóng dialog
  //               }
  //             },
  //             child: const Text('Gửi'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
