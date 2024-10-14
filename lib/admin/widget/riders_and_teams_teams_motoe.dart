// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/admin/widget/grid_view_teams.dart';

import '../../view_model/riders_and_teams_teams_motoe_view_model.dart';
import '../../widgets/common/image_extention.dart';

class RidersAndTeamsTeamsMotoE extends StatefulWidget {
  const RidersAndTeamsTeamsMotoE({super.key});

  @override
  State<RidersAndTeamsTeamsMotoE> createState() =>
      _RidersAndTeamsTeamsMotoEState();
}

class _RidersAndTeamsTeamsMotoEState extends State<RidersAndTeamsTeamsMotoE> {
  final controllerRiders = Get.put(RidersAndTeamsTeamsMotoeViewModel());
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
                      _grandsPrixMonth('Teams'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(context, controllerRiders,
                                  'Riders&Team/Teams/MotoE');
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
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controllerRiders.teamsMotoe.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GridViewTeams(
                    controller: controllerRiders,
                    listDS: controllerRiders.teamsMotoe,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _showInputDialog(BuildContext context,
      RidersAndTeamsTeamsMotoeViewModel controller, String path) {
    final _formKey = GlobalKey<FormState>();
    String BikeManufacturer = '';
    String Id = '';
    String Image = '';
    String Rider1 = '';
    String Rider2 = '';
    String Team = '';

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
                    decoration:
                        const InputDecoration(labelText: 'BikeManufacturer'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add BikeManufacturer';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      BikeManufacturer = value;
                    },
                  ),
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
                    decoration: const InputDecoration(labelText: 'Image'),
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
                    decoration: const InputDecoration(labelText: 'Rider1'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Rider1';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Rider1 = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Rider2'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Rider2';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Rider2 = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Team'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Team';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Team = value;
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
                    'BikeManufacturer': BikeManufacturer,
                    'Id': Id,
                    'Image': Image,
                    'Rider1': Rider1,
                    'Rider2': Rider2,
                    'Team': Team,
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
                    controller.teamsMotoe.value = updatedData;
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

  Future<void> _refreshData() async {
    await Future.wait([
      controllerRiders.fetchRidersMotoe(),
      controllerRiders.fetchTeamsMotoe(),
    ]);
  }
}
