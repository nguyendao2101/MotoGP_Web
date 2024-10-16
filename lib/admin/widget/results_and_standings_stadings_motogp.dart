// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/view_model/pdf_motogp.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';
import '../../view_model/result_and_stadings_standings_motogp_view_model.dart';
import 'results_and_standings_stadings_list_view.dart';
import 'table_stadings_motogp.dart';

class ResultsAndStandingsStadingsMotogp extends StatefulWidget {
  const ResultsAndStandingsStadingsMotogp({super.key});

  @override
  State<ResultsAndStandingsStadingsMotogp> createState() =>
      _ResultsAndStandingsStadingsMotogpState();
}

class _ResultsAndStandingsStadingsMotogpState
    extends State<ResultsAndStandingsStadingsMotogp> {
  final controllerRiders = Get.put(ResultAndStadingsStandingsMotogpViewModel());
  final controllerPDF = Get.put(PdfMotogp());
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
                      _grandsPrixMonth('MotoGP Standings'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(context, controllerRiders,
                                  'Results&Standings/Standings/2024/RidersChampionship/MotoGPADD');
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
                if (controllerRiders.standingsMotoGP.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return ResultsAndStandingsStadingsListView(
                    controller: controllerRiders,
                    listDS: controllerRiders.standingsMotoGP,
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
                      _grandsPrixMonth('MotoGP Standings Add'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(context, controllerRiders,
                                  'Results&Standings/Standings/2024/RidersChampionship/MotoGPADD');
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
                if (controllerRiders.standingsMotoGPAdd.isEmpty) {
                  return const SliverFillRemaining(
                      child: Center(child: Text('No data added yet')));
                } else {
                  return ResultsAndStandingsStadingsListView(
                    controller: controllerRiders,
                    listDS: controllerRiders.standingsMotoGPAdd,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const TableStadingsMotogp());
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: const Text('Championship MotoGP 2024 Rider'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const TableStadingsMotogp());
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child:
                            const Text('Championship MotoGP 2024 Constructer'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const TableStadingsMotogp());
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: const Text('Championship MotoGP 2024 Team'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
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
                  width: 380,
                ),
                _textHeaderBlack('Rider'),
                const SizedBox(
                  width: 460,
                ),
                _textHeaderGrey('Team'),
                const SizedBox(
                  width: 720,
                ),
                _textHeaderBlack('Points'),
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
      style: const TextStyle(fontSize: 20, color: Colors.black),
    );
  }

  Text _textHeaderGrey(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, color: Colors.grey),
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

  void _showInputDialog(BuildContext context,
      ResultAndStadingsStandingsMotogpViewModel controller, String path) {
    final _formKey = GlobalKey<FormState>();
    String Id = '';
    String Points = '';

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
                    controller.standingsMotoGPAdd.value = updatedData;
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
      controllerRiders.fetchRidersMotoGP(),
      controllerRiders.fetchRidersMotoGPSubstitute(),
      controllerRiders.fetchRidersMotoGPWildCardsAndTestRiders(),
      controllerRiders.fetchStandingsMotoGP(),
      controllerRiders.fetchRidersStandingsMotoGPAdd(),
    ]);
  }
}
