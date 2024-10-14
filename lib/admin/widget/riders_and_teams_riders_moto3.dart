// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unused_element, avoid_print, use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/moto3_view_model.dart';
import '../../widgets/common/image_extention.dart';
import 'grid_view_raders.dart';

class RidersAndTeamsRidersMoto3 extends StatefulWidget {
  const RidersAndTeamsRidersMoto3({super.key});

  @override
  State<RidersAndTeamsRidersMoto3> createState() =>
      _RidersAndTeamsRidersMoto3State();
}

class _RidersAndTeamsRidersMoto3State extends State<RidersAndTeamsRidersMoto3> {
  final controller = Get.put(Moto3ViewModel());

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
                      _grandsPrixMonth('Official'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(context, controller,
                                  'Riders&Team/Riders/Moto3/Official');
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

              // SliverGrid for displaying riders
              Obx(() {
                if (controller.ridersListMoto3Official.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverGridRiders(
                    controller: controller,
                    listDS: controller.ridersListMoto3Official,
                  );
                }
              }),

              // Sliver footer
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _grandsPrixMonth('Wildcards And Test Riders'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(context, controller,
                                  'Riders&Team/Riders/Moto3/WildcardsAndTestRiders');
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

              Obx(
                () {
                  if (controller
                      .ridersListMoto3WildcardsAndTestRiders.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverGridRiders(
                      controller: controller,
                      listDS: controller.ridersListMoto3WildcardsAndTestRiders,
                    );
                  }
                },
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _grandsPrixMonth('Substitute'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(context, controller,
                                  'Riders&Team/Riders/Moto3/Substitute');
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

              Obx(
                () {
                  if (controller.ridersListMoto3Substitute.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverGridRiders(
                      controller: controller,
                      listDS: controller.ridersListMoto3Substitute,
                    );
                  }
                },
              ),
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

  void _showInputDialog(
      BuildContext context, Moto3ViewModel controller, String path) {
    final _formKey = GlobalKey<FormState>();
    String Country = '';
    String Id = '';
    String ImageCountry = '';
    String ImageRacer = '';
    String Moto2Podiums = '';
    String Moto2Poles = '';
    String Moto2Races = '';
    String Moto2Victories = '';
    String Moto2WorldChampionships = '';
    String Moto3Podiums = '';
    String Moto3Poles = '';
    String Moto3Races = '';
    String Moto3Victories = '';
    String Moto3WorldChampionships = '';
    String MotoGPPodiums = '';
    String MotoGPPoles = '';
    String MotoGPRaces = '';
    String MotoGPVictories = '';
    String MotoGPWorldChampionships = '';
    String Name = '';
    String Points = '';
    String Position = '';
    String Team = '';
    String TeamMateImage = '';
    String TeamMateName = '';
    String TotalPodiums = '';
    String TotalPoles = '';
    String TotalRaces = '';
    String TotalVictories = '';
    String TotalWorldChampionships = '';
    String Victories = '';

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
                    decoration: const InputDecoration(labelText: 'Country'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Country';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Country = value;
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
                    decoration:
                        const InputDecoration(labelText: 'ImageCountry'),
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
                    decoration: const InputDecoration(labelText: 'ImageRacer'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add ImageRacer';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      ImageRacer = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Moto2Podiums'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2Podiums';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2Podiums = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Moto2Poles'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2Poles';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2Poles = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Moto2Races'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2Races';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2Races = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Moto2Victories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2Victories';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2Victories = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Moto2WorldChampionships'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2WorldChampionships';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2WorldChampionships = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Moto3Podiums'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3Podiums';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3Podiums = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Moto3Poles'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3Poles';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3Poles = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Moto3Races'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3Races';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3Races = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Moto3Victories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3Victories';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3Victories = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Moto3WorldChampionships'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3WorldChampionships';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3WorldChampionships = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'MotoGPPodiums'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPPodiums';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPPodiums = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'MotoGPPoles'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPPoles';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPPoles = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'MotoGPRaces'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPRaces';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPRaces = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'MotoGPVictories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPVictories';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPVictories = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'MotoGPWorldChampionships'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPWorldChampionships';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPWorldChampionships = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Name = value;
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
                    decoration: const InputDecoration(labelText: 'Position'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Position';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Position = value;
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
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'TeamMateImage'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TeamMateImage';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TeamMateImage = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'TeamMateName'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TeamMateName';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TeamMateName = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'TotalPodiums'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalPodiums';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalPodiums = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'TotalPoles'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalPoles';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalPoles = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'TotalRaces'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalRaces';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalRaces = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'TotalVictories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalVictories';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalVictories = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'TotalWorldChampionships'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalWorldChampionships';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalWorldChampionships = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Victories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Victories';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Victories = value;
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
                    'Country': Country,
                    'Id': Id,
                    'ImageCountry': ImageCountry,
                    'ImageRacer': ImageRacer,
                    'Moto2Podiums': Moto2Podiums,
                    'Moto2Poles': Moto2Poles,
                    'Moto2Races': Moto2Races,
                    'Moto2Victories': Moto2Victories,
                    'Moto2WorldChampionships': Moto2WorldChampionships,
                    'Moto3Podiums': Moto3Podiums,
                    'Moto3Poles': Moto3Poles,
                    'Moto3Races': Moto3Races,
                    'Moto3Victories': Moto3Victories,
                    'Moto3WorldChampionships': Moto3WorldChampionships,
                    'MotoGPPodiums': MotoGPPodiums,
                    'MotoGPPoles': MotoGPPoles,
                    'MotoGPRaces': MotoGPRaces,
                    'MotoGPVictories': MotoGPVictories,
                    'MotoGPWorldChampionships': MotoGPWorldChampionships,
                    'Name': Name,
                    'Points': Points,
                    'Position': Position,
                    'Team': Team,
                    'TeamMateImage': TeamMateImage,
                    'TeamMateName': TeamMateName,
                    'TotalPodiums': TotalPodiums,
                    'TotalPoles': TotalPoles,
                    'TotalRaces': TotalRaces,
                    'TotalVictories': TotalVictories,
                    'TotalWorldChampionships': TotalWorldChampionships,
                    'Victories': Victories,
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
                    controller.ridersListMoto3Official.value = updatedData;
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
      controller.fetchRidersMoto3Official(),
      controller.fetchRidersMoto3Substitute(),
      controller.fetchRidersMoto3WildcardsAndTestRiders(),
    ]);
  }
}
