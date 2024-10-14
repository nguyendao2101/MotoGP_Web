// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class RidersAndTeamsLegendsViewModel extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  RxList<Map<String, dynamic>> ridersListLegends = <Map<String, dynamic>>[].obs;

// Temporary storage for rider details
  Map<String, Map<String, dynamic>> ridersMap = {};

  @override
  void onInit() {
    super.onInit();
    fetchRidersListLegends();
  }

  // Fetch MotoGP riders' data and store in ridersMap
  Future<void> fetchRidersListLegends() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Riders&Team/Legends');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        print('day la tu legends: ${snapshot.value}');
        Map<String, dynamic> ridersMapData =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListLegends.clear();
        ridersMapData.forEach((key, value) {
          Map<String, dynamic> riderData = {
            'id': key,
            'ImageCountry': value['ImageCountry'] ?? 'N/A',
            'Country': value['Country'] ?? 'N/A',
            'Id': value['Id'] ?? 'N/A',
            'ImageRacer': value['Image'] ?? '',
            'Name': value['Name'] ?? 'N/A',
            'TotalPodiums': value['TotalPodiums'] ?? 'N/A',
            'ToTalPoles': value['ToTalPoles'] ?? 'N/A',
            'TotalRaces': value['TotalRaces'] ?? 'N/A',
            'TotalVictories': value['TotalVictories'] ?? 'N/A',
            'TotalWorldChampionships':
                value['TotalWorldChampionships'] ?? 'N/A',
            'Debut': value['Debut'] ?? 'N/A',
            'Last Race': value['Last Race'] ?? 'N/A',
            'Seasons': value['Seasons'] ?? 'N/A',
            'WorldChampionshipTitles':
                value['WorldChampionshipTitles'] ?? 'N/A',
            'Years Active': value['Years Active'] ?? 'N/A',
          };
          ridersMap[key] = riderData; // Update ridersMap without overwriting
          ridersListLegends.add(riderData);
        });
      }
    });
  }
}
