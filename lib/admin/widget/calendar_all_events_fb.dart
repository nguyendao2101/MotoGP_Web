// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/calendar_view_model.dart';
import '../../widgets/common/image_extention.dart';
import 'grand_prix_card.dart';

class CalendarAllEventsFb extends StatefulWidget {
  const CalendarAllEventsFb({super.key});

  @override
  State<CalendarAllEventsFb> createState() => _CalendarAllEventsFbState();
}

class _CalendarAllEventsFbState extends State<CalendarAllEventsFb> {
  final controller = Get.put(CalendarViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: CustomScrollView(
            slivers: [
              // Sliver header
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _grandsPrixMonth('Calendar Add'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(context, controller);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Image.asset(
                                ImageAssest.add,
                                height: 40,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.refresh,
                              size: 30,
                            ),
                            onPressed: () async {
                              await _refreshData(); // Gọi phương thức refresh dữ liệu
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.addCalendarAllEvents.isEmpty) {
                  return const SliverFillRemaining(
                      child: Center(child: Text('No data added yet')));
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.addCalendarAllEvents,
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
                if (controller.allEventsNovemberTest.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsNovemberTest,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('February'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsFebruary.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsFebruary,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Column(
                    children: [
                      _grandsPrixMonth('March'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsMarch.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsMarch,
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
                if (controller.allEventsApril.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsApril,
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
                if (controller.allEventsMay.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsMay,
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
                if (controller.allEventsJune.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsJune,
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
                if (controller.allEventsJuly.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsJuly,
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
                if (controller.allEventsAugust.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsAugust,
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
                if (controller.allEventsSeptember.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsSeptember,
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
                if (controller.allEventsOctober.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsOctober,
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
                if (controller.allEventsNovember.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsNovember,
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

  void _showInputDialog(BuildContext context, CalendarViewModel controller) {
    final _formKey = GlobalKey<FormState>();
    String Category = '';
    String DayEnd = '';
    String DayStart = '';
    String EventName = '';
    String Image = '';
    String ImageCountry = '';
    String ImageDetail = '';
    String Location = '';
    String MonthEnd = '';
    String MonthStart = '';
    String Status = '';

    // Khởi tạo database reference
    final DatabaseReference database =
        FirebaseDatabase.instance.ref('Calendar/AllEvents/AddCalendar');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Information calendar'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Category'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add Category';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    Category = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'DayStart'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add DayStart';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    DayStart = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'DayEnd'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add DayEnd';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    DayEnd = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'MonthStart'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add MonthStart';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    MonthStart = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'MonthEnd'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add MonthEnd';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    MonthEnd = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Status'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add Status';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    Status = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'EventName'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add EventName';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    EventName = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add Location';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    Location = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ImageDetail'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add Image';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    Image = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Image'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add ImageCountry';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    ImageCountry = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ImageCountry'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add ImageDetail';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    ImageDetail = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Tạo một ID tự động (có thể sử dụng push() để tự động tạo ID)
                  DatabaseReference newEntryRef = database.push();

                  // Tạo đối tượng dữ liệu
                  Map<String, dynamic> data = {
                    'Category': Category,
                    'DayStart': DayStart,
                    'DayEnd': DayEnd,
                    'MonthStart': MonthStart,
                    'MonthEnd': MonthEnd,
                    'Status': Status,
                    'EventName': EventName,
                    'Location': Location,
                    'Image': Image,
                    'ImageCountry': ImageCountry,
                    'ImageDetail': ImageDetail,
                  };

                  // Gửi dữ liệu lên Firebase
                  await newEntryRef.set(data).then((_) async {
                    print(
                        'Dữ liệu đã được gửi thành công với ID: ${newEntryRef.key}');

                    // Lấy danh sách cập nhật từ Firebase
                    var updatedData = await FirebaseDatabase.instance
                        .ref('Calendar/AllEvents/AddCalendar')
                        .get()
                        .then((snapshot) => snapshot.children
                            .map((e) => e.value as Map<String, dynamic>)
                            .toList());

                    // Cập nhật lại controller.addCalendar
                    controller.addCalendar.value = updatedData;
                  }).catchError((error) {
                    print('Lỗi khi gửi dữ liệu: $error');
                  });

                  Navigator.of(context).pop(); // Đóng dialog
                }
              },
              child: const Text('Gửi'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _refreshData() async {
    await Future.wait([
      controller.fetchAllEventsFebruary(),
      controller.fetchAllEventsMarch(),
      controller.fetchAllEventsApril(),
      controller.fetchAllEventsMay(),
      controller.fetchAllEventsJune(),
      controller.fetchAllEventsJuly(),
      controller.fetchAllEventsAugust(),
      controller.fetchAllEventsSeptember(),
      controller.fetchAllEventsOctober(),
      controller.fetchAllEventsNovember(),
      controller.fetchAllEventsNovemberTest(),
      controller.fetchAddCalendarAllEvents(),
    ]);
  }
}
