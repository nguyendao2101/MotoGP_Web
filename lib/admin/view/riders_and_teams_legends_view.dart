// ignore_for_file: non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/admin/widget/grid_view_legends.dart';
import '../../view_model/riders_and_teams_legends_view_model.dart';
import '../../widgets/common/image_extention.dart';

class RidersAndTeamsLegendsView extends StatelessWidget {
  final controller = Get.put(RidersAndTeamsLegendsViewModel());
  RidersAndTeamsLegendsView({super.key});

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
                      _grandsPrixMonth('Legends'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showInputDialog(
                                  context, controller, 'Riders&Team/Legends');
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

              // SliverGrid for displaying riders
              Obx(() {
                if (controller.ridersListLegends.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GridViewLegends(
                    controller: controller,
                    listDS: controller.ridersListLegends,
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

  void _showInputDialog(BuildContext context,
      RidersAndTeamsLegendsViewModel controller, String path) {
    final _formKey = GlobalKey<FormState>();
    String Country = '';
    String Debut = '';
    String Id = '';
    String Image = '';
    String ImageCountry = '';
    String LastRace = '';
    String Name = '';
    String Seasons = '';
    String ToTalPoles = '';
    String TotalPodiums = '';
    String TotalRaces = '';
    String TotalVictories = '';
    String TotalWorldChampionships = '';
    String WorldChampionshipTitles = '';
    String YearsActive = '';

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
                    decoration: const InputDecoration(labelText: 'Debut'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Debut';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Debut = value;
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
                    decoration: const InputDecoration(labelText: 'Last Race'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Last Race';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      LastRace = value;
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
                    decoration: const InputDecoration(labelText: 'Seasons'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Seasons';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Seasons = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'ToTalPoles'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add ToTalPoles';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      ToTalPoles = value;
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
                    decoration: const InputDecoration(
                        labelText: 'WorldChampionshipTitles'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add WorldChampionshipTitles';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      WorldChampionshipTitles = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Years Active'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Years Active';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      YearsActive = value;
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
                    'Debut': Debut,
                    'Id': Id,
                    'Image': Image,
                    'ImageCountry': ImageCountry,
                    'Last Race': LastRace,
                    'Name': Name,
                    'Seasons': Seasons,
                    'ToTalPoles': ToTalPoles,
                    'TotalPodiums': TotalPodiums,
                    'TotalRaces': TotalRaces,
                    'TotalVictories': TotalVictories,
                    'TotalWorldChampionships': TotalWorldChampionships,
                    'WorldChampionshipTitles': WorldChampionshipTitles,
                    'Years Active': YearsActive,
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
                    controller.ridersListLegends.value = updatedData;
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
      controller.fetchRidersListLegends(),
    ]);
  }
}
