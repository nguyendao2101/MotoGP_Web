// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RidersAndTeamsViewModels extends GetxController {
  final txtSearch = TextEditingController().obs;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  RxList<Map<String, dynamic>> ridersListMotoGP = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ridersListMotoGPSubstitute =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ridersListMotoGPWildCardsAndTestRiders =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> resultsMotoGPRAC = <Map<String, dynamic>>[].obs;
  // Temporary storage for rider details
  Map<String, Map<String, dynamic>> ridersMap = {};

  @override
  void onInit() {
    super.onInit();
    fetchRidersMotoGP();
    fetchRidersMotoGPSubstitute();
    fetchRidersMotoGPWildCardsAndTestRiders();
    fetchResultMotoGPRAC();
  }

  //riders&teams/riders/motogp/official
  Future<void> fetchRidersMotoGP() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Riders&Team/Riders/MotoGP/Official');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> ridersMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMotoGP.clear();
        ridersMap.forEach((key, value) {
          ridersListMotoGP.add({
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
          });
        });
      }
    });
  }

  //riders&teams/riders/motogp/substitute
  Future<void> fetchRidersMotoGPSubstitute() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Riders&Team/Riders/MotoGP/Substitute');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> ridersMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMotoGPSubstitute.clear();
        ridersMap.forEach((key, value) {
          ridersListMotoGPSubstitute.add({
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
          });
        });
      }
    });
  }

  //riders&teams/riders/motogp/wildcardsandtestriders
  Future<void> fetchRidersMotoGPWildCardsAndTestRiders() async {
    DatabaseReference officialRidersRef = _databaseReference
        .child('Riders&Team/Riders/MotoGP/WildcardsAndTestRiders');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> ridersMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMotoGPWildCardsAndTestRiders.clear();
        ridersMap.forEach((key, value) {
          ridersListMotoGPWildCardsAndTestRiders.add({
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
          });
        });
      }
    });
  }

  Future<void> fetchResultMotoGPRAC() async {
    DatabaseReference officialRidersRef = _databaseReference.child(
        'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/MotoGP/RAC');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        print('Data received: ${snapshot.value}');
        if (snapshot.value is List) {
          List<dynamic> resultsList =
              List<dynamic>.from(snapshot.value as List);
          resultsMotoGPRAC.clear();
          // Bỏ qua phần tử đầu tiên nếu nó là null
          for (int i = 1; i < resultsList.length; i++) {
            var result = resultsList[i];
            if (result is Map) {
              resultsMotoGPRAC.add({
                'id': i
                    .toString(), // Chỉ định id nếu bạn không có id gốc từ dữ liệu
                'Id': result['Id'] ?? 'N/A',
                'Points': result['Points'] ?? 'N/A',
                'Time': result['Time'] ?? 'N/A',
              });
            }
          }
        } else {
          print('Unexpected data format: ${snapshot.value.runtimeType}');
        }
      }
    });
  }
}
