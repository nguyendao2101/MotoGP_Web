import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class Moto2ViewModel extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  RxList<Map<String, dynamic>> ridersListMoto2Official =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ridersListMoto2Substitute =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ridersListMoto2WildcardsAndTestRiders =
      <Map<String, dynamic>>[].obs;

  // Temporary storage for rider details
  Map<String, Map<String, dynamic>> ridersMap = {};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRidersMoto2Official();
    fetchRidersMoto2Substitute();
    fetchRidersMoto2WildcardsAndTestRiders();
  }

  String extractNumbers(String input) {
    // Sử dụng regex để tìm tất cả các chữ số trong chuỗi
    RegExp regExp = RegExp(r'\d+');
    Iterable<RegExpMatch> matches = regExp.allMatches(input);
    return matches.map((m) => m.group(0)).join();
  }

  //moto2/official

  Future<void> fetchRidersMoto2Official() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Riders&Team/Riders/Moto2/Official');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> ridersMapData =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMoto2Official.clear();
        ridersMapData.forEach((key, value) {
          Map<String, dynamic> riderData = {
            'id': key,
            'ImageCountry': value['ImageCountry'] ?? 'N/A',
            'Country': value['Country'] ?? 'N/A',
            'Id': value['Id'] ?? 'N/A',
            'ImageRacer': value['ImageRacer'] ?? '',
            'Name': value['Name'] ?? 'N/A',
            'Team': value['Team'] ?? 'N/A',
            'Position': value['Position'] ?? 'N/A',
            'Points': value['Points'] ?? 'N/A',
            'Victories': value['Victories'] ?? 'N/A',
          };
          ridersMap[key] = riderData; // Update ridersMap without overwriting
          ridersListMoto2Official.add(riderData);
        });
      }
    });
  }

  //moto2/substitute
  Future<void> fetchRidersMoto2Substitute() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Riders&Team/Riders/Moto2/Substitute');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> ridersMapData =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMoto2Substitute.clear();
        ridersMapData.forEach((key, value) {
          Map<String, dynamic> riderData = {
            'id': key,
            'ImageCountry': value['ImageCountry'] ?? 'N/A',
            'Country': value['Country'] ?? 'N/A',
            'Id': value['Id'] ?? 'N/A',
            'ImageRacer': value['ImageRacer'] ?? '',
            'Name': value['Name'] ?? 'N/A',
            'Team': value['Team'] ?? 'N/A',
            'Position': value['Position'] ?? 'N/A',
            'Points': value['Points'] ?? 'N/A',
            'Victories': value['Victories'] ?? 'N/A',
          };
          ridersMap[key] = riderData; // Update ridersMap without overwriting
          ridersListMoto2Substitute.add(riderData);
        });
      }
    });
  }

  //moto2/wildcardsandtestriders
  Future<void> fetchRidersMoto2WildcardsAndTestRiders() async {
    DatabaseReference officialRidersRef = _databaseReference
        .child('Riders&Team/Riders/Moto2/WildcardsAndTestRiders');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> ridersMapData =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMoto2WildcardsAndTestRiders.clear();
        ridersMapData.forEach((key, value) {
          Map<String, dynamic> riderData = {
            'id': key,
            'ImageCountry': value['ImageCountry'] ?? 'N/A',
            'Country': value['Country'] ?? 'N/A',
            'Id': value['Id'] ?? 'N/A',
            'ImageRacer': value['ImageRacer'] ?? '',
            'Name': value['Name'] ?? 'N/A',
            'Team': value['Team'] ?? 'N/A',
            'Position': value['Position'] ?? 'N/A',
            'Points': value['Points'] ?? 'N/A',
            'Victories': value['Victories'] ?? 'N/A',
          };
          ridersMap[key] = riderData; // Update ridersMap without overwriting
          ridersListMoto2WildcardsAndTestRiders.add(riderData);
        });
      }
    });
  }
}
