// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/moto2_view_model.dart';
import '../../widgets/common/image_extention.dart';
import 'results_and_standings_list_view.dart';

class ResultsAndStandingsResultsMoto2Rac extends StatefulWidget {
  const ResultsAndStandingsResultsMoto2Rac({super.key});

  @override
  State<ResultsAndStandingsResultsMoto2Rac> createState() =>
      _ResultsAndStandingsResultsMoto2RacState();
}

class _ResultsAndStandingsResultsMoto2RacState
    extends State<ResultsAndStandingsResultsMoto2Rac> {
  final controllerRiders = Get.put(Moto2ViewModel());
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
                      _grandsPrixMonth('Moto2 RAC'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(context, controllerRiders,
                                  'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/Moto2/RACADD');
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Column(
                    children: [
                      _textInfomation(),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controllerRiders.resultsMoto2RAC.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverListResults(
                    controller: controllerRiders,
                    listDS: controllerRiders.resultsMoto2RAC,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _grandsPrixMonth('Moto2 RAC Add'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(context, controllerRiders,
                                  'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/Moto2/RACADD');
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Column(
                    children: [
                      _textInfomation(),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controllerRiders.resultsMoto2RACAdd.isEmpty) {
                  return const SliverFillRemaining(
                      child: Center(child: Text('No data added yet')));
                } else {
                  return SliverListResults(
                    controller: controllerRiders,
                    listDS: controllerRiders.resultsMoto2RACAdd,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textInfomation() {
    return Stack(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white, // Màu nền của Container
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow offset
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _textHeaderBlack('Pos.'),
                const SizedBox(
                  width: 85,
                ),
                _textHeaderGrey('Pts'),
                const SizedBox(
                  width: 360,
                ),
                _textHeaderBlack('Rider'),
                const SizedBox(
                  width: 360,
                ),
                _textHeaderGrey('Team'),
                const SizedBox(
                  width: 700,
                ),
                _textHeaderBlack('Time/Gap'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text _textHeaderBlack(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }

  Text _textHeaderGrey(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.grey),
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

  void _showInputDialog(
      BuildContext context, Moto2ViewModel controller, String path) {
    final _formKey = GlobalKey<FormState>();
    String Id = '';
    String Points = '';
    String Time = '';

    // Khởi tạo database reference
    final DatabaseReference database = FirebaseDatabase.instance.ref(path);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Information Rider'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Id'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Id';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Id = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Points'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Points';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Points = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Time'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Time';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Time = value;
                    },
                  ),
                ],
              ),
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
                    'Points': Points,
                    'Id': Id,
                    'Time': Time,
                  };

                  // Gửi dữ liệu lên Firebase
                  await newEntryRef.set(data).then((_) async {
                    print(
                        'Dữ liệu đã được gửi thành công với ID: ${newEntryRef.key}');

                    // Lấy danh sách cập nhật từ Firebase
                    var updatedData = await FirebaseDatabase.instance
                        .ref(path)
                        .get()
                        .then((snapshot) => snapshot.children
                            .map((e) => e.value as Map<String, dynamic>)
                            .toList());

                    // Cập nhật lại controller.addCalendar
                    controller.resultsMoto2RACAdd.value = updatedData;
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
      controllerRiders.fetchRidersMoto2Official(),
      controllerRiders.fetchRidersMoto2Substitute(),
      controllerRiders.fetchRidersMoto2WildcardsAndTestRiders(),
      controllerRiders.fetchResultMoto2RAC(),
      controllerRiders.fetchRidersresultMoto2RACAdd(),
    ]);
  }
}
