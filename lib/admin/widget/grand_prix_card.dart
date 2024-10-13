import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calendar_detail.dart';

class GrandPrixCard extends StatelessWidget {
  final controller;
  final RxList<Map<String, dynamic>>
      listDS; // Truyền thêm danh sách ridersListMotoGP

  const GrandPrixCard({
    super.key,
    this.controller,
    required this.listDS,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final calendarList = listDS.value;
      if (listDS.isEmpty) {
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var calendar = calendarList[index];

                return InkWell(
                  onTap: () {
                    Get.to(() => CalendarDetail(
                          calendar: calendar,
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 16),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          padding: const EdgeInsets.symmetric(horizontal: 64),
                          decoration: BoxDecoration(
                            color: Colors.white, // Màu nền của Container
                            borderRadius: BorderRadius.circular(6), // Bo góc
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Màu bóng mờ (đen mờ)
                                spreadRadius: 5, // Độ lan rộng của bóng
                                blurRadius: 10, // Độ mờ của bóng
                                offset: const Offset(
                                    0, 3), // Vị trí của bóng (trục x, trục y)
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                // dayStart,
                                calendar['DayStart'],
                                style: const TextStyle(
                                    fontSize: 58,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                '-',
                                style: const TextStyle(
                                    fontSize: 58,
                                    color: Color.fromARGB(255, 102, 94, 94),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                // dayEnd,
                                calendar['DayEnd'],
                                style: const TextStyle(
                                    fontSize: 58,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 46),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // grandPrixName,
                                    calendar['EventName'],
                                    style: const TextStyle(
                                        fontSize: 32,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Image.network(
                                        // grandCountry,
                                        calendar['ImageDetail'],
                                        height: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        // location,
                                        calendar['Location'],
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Image.network(
                            // grandPrixImage,
                            calendar['ImageCountry'],
                            height: 140,
                            width: 520,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 94,
                          left: 206,
                          child: Text(
                            // monthEnd,
                            calendar['MonthEnd'],
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 75, 73, 73),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 94,
                          left: 82,
                          child: Text(
                            // monthStart,
                            calendar['MonthStart'],
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 75, 73, 73),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: -25,
                          left: 220,
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 30,
                            ),
                            onPressed: () {
                              // Hiển thị dialog chỉnh sửa
                              _showEditDialog(
                                  context, calendarList[index], index);
                            },
                          ),
                        ),
                        Positioned(
                          top: -25,
                          left: 260,
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () async {
                              try {
                                // Lấy ID của tài liệu từ dữ liệu của calendar
                                String documentId = calendarList[index]['id'];

                                // Lấy dữ liệu từ Calendar/GrandsPrix
                                final snapshot = await FirebaseDatabase.instance
                                    .ref('Calendar/GrandsPrix')
                                    .get();

                                if (snapshot.exists) {
                                  // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                                  for (var grandPrixEntry
                                      in snapshot.children) {
                                    // Kiểm tra xem documentId có tồn tại trong nhánh này không
                                    final addCalendarSnapshot =
                                        grandPrixEntry.child(documentId);
                                    if (addCalendarSnapshot.exists) {
                                      // Nếu tồn tại, thực hiện xóa
                                      await FirebaseDatabase.instance
                                          .ref(
                                              'Calendar/GrandsPrix/${grandPrixEntry.key}/$documentId')
                                          .remove();

                                      // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                      listDS.removeAt(index);

                                      // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                      return;
                                    }
                                  }
                                }

                                // Lấy dữ liệu từ Calendar/GrandsPrix
                                final snapshot2 = await FirebaseDatabase
                                    .instance
                                    .ref('Calendar/AllEvents')
                                    .get();

                                if (snapshot2.exists) {
                                  // Duyệt qua từng nhánh con của Calendar/AllEvents
                                  for (var allEventsEntry
                                      in snapshot2.children) {
                                    // Kiểm tra xem documentId có tồn tại trong nhánh này không
                                    final addCalendarSnapshot =
                                        allEventsEntry.child(documentId);
                                    if (addCalendarSnapshot.exists) {
                                      // Nếu tồn tại, thực hiện xóa
                                      await FirebaseDatabase.instance
                                          .ref(
                                              'Calendar/AllEvents/${allEventsEntry.key}/$documentId')
                                          .remove();

                                      // Nếu việc xóa thành công, xóa mục khỏi danh sách
                                      listDS.removeAt(index);

                                      // Thoát khỏi vòng lặp sau khi tìm thấy và xóa
                                      return;
                                    }
                                  }
                                }

                                // Nếu không tìm thấy documentId, in ra thông báo lỗi
                                print(
                                    'Không tìm thấy documentId trong các nhánh con.');
                              } catch (e) {
                                // Xử lý lỗi nếu có vấn đề xảy ra
                                print(
                                    'Lỗi khi xóa dữ liệu từ Realtime Database: $e');
                              }
                            },
                          ),
                        ),
                        Positioned(
                          top: -20,
                          left: 45,
                          child: Container(
                            width: 160,
                            height: 32,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(255, 180, 41, 31),
                                  Colors.black,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // '  $gpNumber',
                                    '  ${calendar['Category']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    child: VerticalDivider(
                                      width: 1,
                                      thickness: 2,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    // '$raceStatus  ',
                                    '${calendar['Status']}  ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount:
                  calendarList.length, // Số lượng phần tử trong danh sách
            ),
          ),
        );
      }
    });
  }

  void _showEditDialog(
      BuildContext context, Map<String, dynamic> calendar, int index) {
    final TextEditingController eventNameController =
        TextEditingController(text: calendar['EventName']);
    final TextEditingController locationController =
        TextEditingController(text: calendar['Location']);
    final TextEditingController dayStartController =
        TextEditingController(text: calendar['DayStart']);
    final TextEditingController dayEndController =
        TextEditingController(text: calendar['DayEnd']);
    //
    final TextEditingController categoryController =
        TextEditingController(text: calendar['Category']);
    final TextEditingController imageController =
        TextEditingController(text: calendar['Image']);
    final TextEditingController imageCountryController =
        TextEditingController(text: calendar['ImageCountry']);
    final TextEditingController imageDetailController =
        TextEditingController(text: calendar['ImageDetail']);
    final TextEditingController monthEndController =
        TextEditingController(text: calendar['MonthEnd']);
    final TextEditingController monthStartController =
        TextEditingController(text: calendar['MonthStart']);
    final TextEditingController statusController =
        TextEditingController(text: calendar['Status']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Infomation'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: categoryController,
                  decoration: const InputDecoration(labelText: 'Category'),
                ),
                TextField(
                  controller: statusController,
                  decoration: const InputDecoration(labelText: 'Status'),
                ),
                TextField(
                  controller: dayStartController,
                  decoration: const InputDecoration(labelText: 'Day Start'),
                ),
                TextField(
                  controller: dayEndController,
                  decoration: const InputDecoration(labelText: 'Day End'),
                ),
                TextField(
                  controller: monthStartController,
                  decoration: const InputDecoration(labelText: 'Month Start'),
                ),
                TextField(
                  controller: monthEndController,
                  decoration: const InputDecoration(labelText: 'Month End'),
                ),
                TextField(
                  controller: eventNameController,
                  decoration: const InputDecoration(labelText: 'Event Name'),
                ),
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(labelText: 'Location'),
                ),
                TextField(
                  controller: imageController,
                  decoration: const InputDecoration(labelText: 'ImageDetail'),
                ),
                TextField(
                  controller: imageCountryController,
                  decoration: const InputDecoration(labelText: 'Image'),
                ),
                TextField(
                  controller: imageDetailController,
                  decoration: const InputDecoration(labelText: 'ImageCountry'),
                ),
                // 'Image': imageDetailController.text,
                //           'ImageCountry': imageController.text,
                //           'ImageDetail': imageCountryController.text,
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog mà không làm gì
              },
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  String documentId = calendar['id'];

                  // Lấy dữ liệu từ Calendar/GrandsPrix
                  final snapshot = await FirebaseDatabase.instance
                      .ref('Calendar/GrandsPrix')
                      .get();

                  if (snapshot.exists) {
                    // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                    for (var grandPrixEntry in snapshot.children) {
                      // Kiểm tra xem documentId có tồn tại trong nhánh này không
                      final addCalendarSnapshot =
                          grandPrixEntry.child(documentId);
                      if (addCalendarSnapshot.exists) {
                        // Nếu tồn tại, thực hiện cập nhật
                        await FirebaseDatabase.instance
                            .ref(
                                'Calendar/GrandsPrix/${grandPrixEntry.key}/$documentId')
                            .update({
                          'EventName': eventNameController.text,
                          'Location': locationController.text,
                          'DayStart': dayStartController.text,
                          'DayEnd': dayEndController.text,
                          'Category': categoryController.text,
                          'MonthStart': monthStartController.text,
                          'MonthEnd': monthEndController.text,
                          'Status': statusController.text,
                          'Image': imageController.text,
                          'ImageCountry': imageCountryController.text,
                          'ImageDetail': imageDetailController.text,
                        });

                        // Cập nhật lại danh sách trong ứng dụng
                        listDS[index] = {
                          ...calendar,
                          'EventName': eventNameController.text,
                          'Location': locationController.text,
                          'DayStart': dayStartController.text,
                          'DayEnd': dayEndController.text,
                          'Category': categoryController.text,
                          'MonthStart': monthStartController.text,
                          'MonthEnd': monthEndController.text,
                          'Status': statusController.text,
                          'Image': imageController.text,
                          'ImageCountry': imageCountryController.text,
                          'ImageDetail': imageDetailController.text,
                        };

                        // Đóng dialog sau khi cập nhật thành công
                        Navigator.of(context).pop();
                        return;
                      }
                    }
                  }
                  // Lấy dữ liệu từ Calendar/AllEvents
                  final snapshot2 = await FirebaseDatabase.instance
                      .ref('Calendar/AllEvents')
                      .get();

                  if (snapshot2.exists) {
                    // Duyệt qua từng nhánh con của Calendar/GrandsPrix
                    for (var grandPrixEntry in snapshot2.children) {
                      // Kiểm tra xem documentId có tồn tại trong nhánh này không
                      final addCalendarSnapshot =
                          grandPrixEntry.child(documentId);
                      if (addCalendarSnapshot.exists) {
                        // Nếu tồn tại, thực hiện cập nhật
                        await FirebaseDatabase.instance
                            .ref(
                                'Calendar/AllEvents/${grandPrixEntry.key}/$documentId')
                            .update({
                          'EventName': eventNameController.text,
                          'Location': locationController.text,
                          'DayStart': dayStartController.text,
                          'DayEnd': dayEndController.text,
                          'Category': categoryController.text,
                          'MonthStart': monthStartController.text,
                          'MonthEnd': monthEndController.text,
                          'Status': statusController.text,
                          'Image': imageController.text,
                          'ImageCountry': imageCountryController.text,
                          'ImageDetail': imageDetailController.text,
                        });

                        // Cập nhật lại danh sách trong ứng dụng
                        listDS[index] = {
                          ...calendar,
                          'EventName': eventNameController.text,
                          'Location': locationController.text,
                          'DayStart': dayStartController.text,
                          'DayEnd': dayEndController.text,
                          'Category': categoryController.text,
                          'MonthStart': monthStartController.text,
                          'MonthEnd': monthEndController.text,
                          'Status': statusController.text,
                          'Image': imageController.text,
                          'ImageCountry': imageCountryController.text,
                          'ImageDetail': imageDetailController.text,
                        };

                        // Đóng dialog sau khi cập nhật thành công
                        Navigator.of(context).pop();
                        return;
                      }
                    }
                  }

                  // Nếu không tìm thấy, thông báo lỗi
                  print('Không tìm thấy documentId trong các nhánh con.');
                } catch (e) {
                  print('Lỗi khi cập nhật dữ liệu: $e');
                }
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }
}
