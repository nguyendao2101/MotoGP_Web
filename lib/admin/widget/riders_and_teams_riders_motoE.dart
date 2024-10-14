// ignore_for_file: file_names, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_element, avoid_print, use_build_context_synchronously
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/motoe_view_model.dart';
import '../../widgets/common/image_extention.dart';
import 'grid_view_raders.dart';

class RidersAndTeamsRidersMotoe extends StatefulWidget {
  const RidersAndTeamsRidersMotoe({super.key});

  @override
  State<RidersAndTeamsRidersMotoe> createState() =>
      _RidersAndTeamsRidersMotoeState();
}

class _RidersAndTeamsRidersMotoeState extends State<RidersAndTeamsRidersMotoe> {
  final controller = Get.put(MotoeViewModel());
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
                                  'Riders&Team/Riders/MotoE/Official');
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
                if (controller.ridersListMotoEOfficial.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverGridRiders(
                    controller: controller,
                    listDS: controller.ridersListMotoEOfficial,
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

  void _showInputDialog(
      BuildContext context, MotoeViewModel controller, String path) {
    final _formKey = GlobalKey<FormState>();
    String Country = ''; //
    String Id = ''; //
    String ImageCountry = ''; //
    String ImageRacer = ''; //
    int Moto2Podiums = 0;
    int Moto2Poles = 0;
    int Moto2Races = 0;
    int Moto2Victories = 0;
    int Moto2WorldChampionships = 0;
    int Moto3Podiums = 0;
    int Moto3Poles = 0;
    int Moto3Races = 0;
    int Moto3Victories = 0;
    int Moto3WorldChampionships = 0;
    int MotoGPPodiums = 0;
    int MotoGPPoles = 0;
    int MotoGPRaces = 0;
    int MotoGPVictories = 0;
    int MotoGPWorldChampionships = 0;
    String Name = ''; //
    int Points = 0;
    int Position = 0;
    String Team = ''; //
    String TeamMateImage = ''; //
    String TeamMateName = ''; //
    int TotalPodiums = 0;
    int TotalPoles = 0;
    int TotalRaces = 0;
    int TotalVictories = 0;
    int TotalWorldChampionships = 0;
    int Victories = 0;

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
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Moto2Podiums'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2Podiums';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2Podiums = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Moto2Races'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2Races';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2Races = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Moto2Podiums'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2Podiums';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2Podiums = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Moto2Victories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2Victories';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2Victories = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Moto2WorldChampionships'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto2WorldChampionships';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto2WorldChampionships = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Moto3Podiums'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3Podiums';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3Podiums = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Moto3Poles'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3Poles';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3Poles = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Moto3Races'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3Races';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3Races = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Moto3Victories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3Victories';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3Victories = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Moto3WorldChampionships'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Moto3WorldChampionships';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Moto3WorldChampionships = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'MotoGPPodiums'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPPodiums';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPPodiums = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'MotoGPPoles'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPPoles';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPPoles = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'MotoGPRaces'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPRaces';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPRaces = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'MotoGPVictories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPVictories';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPVictories = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'MotoGPWorldChampionships'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add MotoGPWorldChampionships';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      MotoGPWorldChampionships = int.parse(value);
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
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Points'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Points';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Points = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Position'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Position';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Position = int.parse(value);
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

                  ////
                  ///
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'TotalPodiums'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalPodiums';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalPodiums = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'TotalPoles'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalPoles';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalPoles = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'TotalRaces'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalRaces';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalRaces = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'TotalVictories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalVictories';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalVictories = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'TotalWorldChampionships'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add TotalWorldChampionships';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      TotalWorldChampionships = int.parse(value);
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Victories'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add Victories';
                      } else if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Victories = int.parse(value);
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
                    controller.ridersListMotoEOfficial.value = updatedData;
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
      controller.fetchRidersMotoEOfficial(),
    ]);
  }
}
