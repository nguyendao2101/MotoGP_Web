// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class CalendarViewModel extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  // all events
  RxList<Map<String, dynamic>> allEventsFebruary = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsMarch = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsApril = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsMay = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsJune = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsJuly = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsAugust = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsSeptember =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsOctober = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsNovember = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> allEventsNovemberTest =
      <Map<String, dynamic>>[].obs;

  //grands prix

  RxList<Map<String, dynamic>> grandsPrixMarch = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> grandsPrixApril = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> grandsPrixMay = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> grandsPrixJune = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> grandsPrixJuly = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> grandsPrixAugust = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> grandsPrixSeptember =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> grandsPrixOctober = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> grandsPrixNovember =
      <Map<String, dynamic>>[].obs;

  // add calendar
  RxList<Map<String, dynamic>> addCalendar = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> addCalendarAllEvents =
      <Map<String, dynamic>>[].obs;

  //
  Map<String, Map<String, dynamic>> calendarMap = {};

  @override
  void onInit() {
    super.onInit();
    //all events
    fetchAllEventsFebruary();
    fetchAllEventsMarch();
    fetchAllEventsApril();
    fetchAllEventsMay();
    fetchAllEventsJune();
    fetchAllEventsJuly();
    fetchAllEventsAugust();
    fetchAllEventsSeptember();
    fetchAllEventsOctober();
    fetchAllEventsNovember();
    fetchAllEventsNovemberTest();

    //grands prix
    fetchGrandsPrixMarch();
    fetchGrandsPrixApril();
    fetchGrandsPrixMay();
    fetchGrandsPrixJune();
    fetchGrandsPrixJuly();
    fetchGrandsPrixAugust();
    fetchGrandsPrixSeptember();
    fetchGrandsPrixOctober();
    fetchGrandsPrixNovember();
    //add calendar
    fetchAddCalendar();
    fetchAddCalendarAllEvents();
  }

  // add calendar
  Future<void> fetchAddCalendar() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Calendar/GrandsPrix/AddCalendar');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      print('kieu du lieu cua addcalendar: ${snapshot.value.runtimeType}');

      if (snapshot.value != null) {
        // print('day la tu legends: ${snapshot.value}');
        Map<String, dynamic> ridersMapData =
            Map<String, dynamic>.from(snapshot.value as Map);
        addCalendar.clear();
        ridersMapData.forEach((key, value) {
          Map<String, dynamic> riderData = {
            'id': key,
            'Category': value['Category'] ?? 'N/A',
            'DayEnd': value['DayEnd'] ?? 'N/A',
            'DayStart': value['DayStart'] ?? 'N/A',
            'EventName': value['EventName'] ?? 'N/A',
            'Image': value['Image'] ?? 'N/A',
            'ImageCountry': value['ImageCountry'] ?? 'N/A',
            'ImageDetail': value['ImageDetail'] ?? 'N/A',
            'Location': value['Location'] ?? 'N/A',
            'MonthEnd': value['MonthEnd'] ?? 'N/A',
            'MonthStart': value['MonthStart'] ?? 'N/A',
            'Status': value['Status'] ?? 'N/A',
          };
          addCalendar.add(riderData);
        });
      }
    });
  }

  // add calendar
  Future<void> fetchAddCalendarAllEvents() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Calendar/AllEvents/AddCalendar');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      print('kieu du lieu cua addcalendar: ${snapshot.value.runtimeType}');

      if (snapshot.value != null) {
        // print('day la tu legends: ${snapshot.value}');
        Map<String, dynamic> ridersMapData =
            Map<String, dynamic>.from(snapshot.value as Map);
        addCalendarAllEvents.clear();
        ridersMapData.forEach((key, value) {
          Map<String, dynamic> riderData = {
            'id': key,
            'Category': value['Category'] ?? 'N/A',
            'DayEnd': value['DayEnd'] ?? 'N/A',
            'DayStart': value['DayStart'] ?? 'N/A',
            'EventName': value['EventName'] ?? 'N/A',
            'Image': value['Image'] ?? 'N/A',
            'ImageCountry': value['ImageCountry'] ?? 'N/A',
            'ImageDetail': value['ImageDetail'] ?? 'N/A',
            'Location': value['Location'] ?? 'N/A',
            'MonthEnd': value['MonthEnd'] ?? 'N/A',
            'MonthStart': value['MonthStart'] ?? 'N/A',
            'Status': value['Status'] ?? 'N/A',
          };
          addCalendarAllEvents.add(riderData);
        });
      }
    });
  }

  //all events/february
  Future<void> fetchAllEventsFebruary() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/February');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      print('tu calendar: ${snapshot.value}');

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsFebruary.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsFebruary.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

//all events/march
  Future<void> fetchAllEventsMarch() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/March');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsMarch.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsMarch.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //all events/april
  Future<void> fetchAllEventsApril() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/April');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsApril.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsApril.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //all events/may
  Future<void> fetchAllEventsMay() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/May');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsMay.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsMay.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //all events/june
  Future<void> fetchAllEventsJune() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/June');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsJune.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsJune.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //all events/july
  Future<void> fetchAllEventsJuly() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/July');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsJuly.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsJuly.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //all events/august
  Future<void> fetchAllEventsAugust() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/August');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsAugust.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsAugust.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //all events/september
  Future<void> fetchAllEventsSeptember() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/September');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsSeptember.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsSeptember.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //all events/october
  Future<void> fetchAllEventsOctober() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/October');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsOctober.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsOctober.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //all events/november
  Future<void> fetchAllEventsNovember() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/November');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsNovember.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsNovember.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //all events/novemberTest
  Future<void> fetchAllEventsNovemberTest() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/AllEvents/NovemberTest');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        allEventsNovemberTest.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            allEventsNovemberTest.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //grands prix/march
  Future<void> fetchGrandsPrixMarch() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/GrandsPrix/March');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        grandsPrixMarch.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            grandsPrixMarch.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //grands prix/april
  Future<void> fetchGrandsPrixApril() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/GrandsPrix/April');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        grandsPrixApril.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            grandsPrixApril.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //grands prix/may
  Future<void> fetchGrandsPrixMay() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/GrandsPrix/May');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        grandsPrixMay.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            grandsPrixMay.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //grands prix/june
  Future<void> fetchGrandsPrixJune() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/GrandsPrix/June');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        grandsPrixJune.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            grandsPrixJune.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //grands prix/july
  Future<void> fetchGrandsPrixJuly() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/GrandsPrix/July');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        grandsPrixJuly.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            grandsPrixJuly.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //grands prix/august
  Future<void> fetchGrandsPrixAugust() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/GrandsPrix/August');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        grandsPrixAugust.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            grandsPrixAugust.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //grands prix/september
  Future<void> fetchGrandsPrixSeptember() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/GrandsPrix/September');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        grandsPrixSeptember.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            grandsPrixSeptember.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

//grands prix/october
  Future<void> fetchGrandsPrixOctober() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/GrandsPrix/October');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        grandsPrixOctober.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            grandsPrixOctober.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

//grands prix/november
  Future<void> fetchGrandsPrixNovember() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Calendar/GrandsPrix/November');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        grandsPrixNovember.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Category': value['Category'] ?? 'N/A',
              'DayEnd': value['DayEnd'] ?? 'N/A',
              'DayStart': value['DayStart'] ?? 'N/A',
              'EventName': value['EventName'] ?? 'N/A',
              'Image': value['Image'] ?? 'N/A',
              'ImageCountry': value['ImageCountry'] ?? 'N/A',
              'ImageDetail': value['ImageDetail'] ?? 'N/A',
              'Location': value['Location'] ?? 'N/A',
              'MonthEnd': value['MonthEnd'] ?? 'N/A',
              'MonthStart': value['MonthStart'] ?? 'N/A',
              'Status': value['Status'] ?? 'N/A',
            };

            grandsPrixNovember.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }
}
