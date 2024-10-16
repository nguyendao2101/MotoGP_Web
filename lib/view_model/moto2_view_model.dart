// ignore_for_file: avoid_print

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
  RxList<Map<String, dynamic>> resultsMoto2RAC = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> resultsMoto2RACAdd =
      <Map<String, dynamic>>[].obs;

  // Temporary storage for rider details
  Map<String, Map<String, dynamic>> ridersMap = {};

  @override
  void onInit() {
    super.onInit();
    fetchRidersMoto2Official();
    fetchRidersMoto2Substitute();
    fetchRidersMoto2WildcardsAndTestRiders();
    fetchResultMoto2RAC();
    fetchRidersresultMoto2RACAdd();
  }

  dynamic zeroToSpace(dynamic input) {
    if (input == 0) {
      input = ' '; // Thay đổi giá trị trực tiếp trong danh sách
    }
    return input;
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
            'TotalPodiums': value['TotalPodiums'] ?? 'N/A',
            'TotalPoles': value['TotalPoles'] ?? 'N/A',
            'TotalRaces': value['TotalRaces'] ?? 'N/A',
            'TotalVictories': value['TotalVictories'] ?? 'N/A',
            'TotalWorldChampionships':
                value['TotalWorldChampionships'] ?? 'N/A',
            'MotoGPRaces': value['MotoGPRaces'] ?? 'N/A',
            'MotoGPPoles': value['MotoGPPoles'] ?? 'N/A',
            'MotoGPPodiums': value['MotoGPPodiums'] ?? 'N/A',
            'MotoGPVictories': value['MotoGPVictories'] ?? 'N/A',
            'MotoGPWorldChampionships':
                value['MotoGPWorldChampionships'] ?? 'N/A',
            'Moto2Races': value['Moto2Races'] ?? 'N/A',
            'Moto2Poles': value['Moto2Poles'] ?? 'N/A',
            'Moto2Podiums': value['Moto2Podiums'] ?? 'N/A',
            'Moto2Victories': value['Moto2Victories'] ?? 'N/A',
            'Moto2WorldChampionships':
                value['Moto2WorldChampionships'] ?? 'N/A',
            'Moto3Races': value['Moto3Races'] ?? 'N/A',
            'Moto3Poles': value['Moto3Poles'] ?? 'N/A',
            'Moto3Podiums': value['Moto3Podiums'] ?? 'N/A',
            'Moto3Victories': value['Moto3Victories'] ?? 'N/A',
            'Moto3WorldChampionships':
                value['Moto3WorldChampionships'] ?? 'N/A',
            'TeamMateImage': value['TeamMateImage'] ?? 'N/A',
            'TeamMateName': value['TeamMateName'] ?? 'N/A',
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
            'TotalPodiums': value['TotalPodiums'] ?? 'N/A',
            'TotalPoles': value['TotalPoles'] ?? 'N/A',
            'TotalRaces': value['TotalRaces'] ?? 'N/A',
            'TotalVictories': value['TotalVictories'] ?? 'N/A',
            'TotalWorldChampionships':
                value['TotalWorldChampionships'] ?? 'N/A',
            'MotoGPRaces': value['MotoGPRaces'] ?? 'N/A',
            'MotoGPPoles': value['MotoGPPoles'] ?? 'N/A',
            'MotoGPPodiums': value['MotoGPPodiums'] ?? 'N/A',
            'MotoGPVictories': value['MotoGPVictories'] ?? 'N/A',
            'MotoGPWorldChampionships':
                value['MotoGPWorldChampionships'] ?? 'N/A',
            'Moto2Races': value['Moto2Races'] ?? 'N/A',
            'Moto2Poles': value['Moto2Poles'] ?? 'N/A',
            'Moto2Podiums': value['Moto2Podiums'] ?? 'N/A',
            'Moto2Victories': value['Moto2Victories'] ?? 'N/A',
            'Moto2WorldChampionships':
                value['Moto2WorldChampionships'] ?? 'N/A',
            'Moto3Races': value['Moto3Races'] ?? 'N/A',
            'Moto3Poles': value['Moto3Poles'] ?? 'N/A',
            'Moto3Podiums': value['Moto3Podiums'] ?? 'N/A',
            'Moto3Victories': value['Moto3Victories'] ?? 'N/A',
            'Moto3WorldChampionships':
                value['Moto3WorldChampionships'] ?? 'N/A',
            'TeamMateImage': value['TeamMateImage'] ?? 'N/A',
            'TeamMateName': value['TeamMateName'] ?? 'N/A',
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
            'TotalPodiums': value['TotalPodiums'] ?? 'N/A',
            'TotalPoles': value['TotalPoles'] ?? 'N/A',
            'TotalRaces': value['TotalRaces'] ?? 'N/A',
            'TotalVictories': value['TotalVictories'] ?? 'N/A',
            'TotalWorldChampionships':
                value['TotalWorldChampionships'] ?? 'N/A',
            'MotoGPRaces': value['MotoGPRaces'] ?? 'N/A',
            'MotoGPPoles': value['MotoGPPoles'] ?? 'N/A',
            'MotoGPPodiums': value['MotoGPPodiums'] ?? 'N/A',
            'MotoGPVictories': value['MotoGPVictories'] ?? 'N/A',
            'MotoGPWorldChampionships':
                value['MotoGPWorldChampionships'] ?? 'N/A',
            'Moto2Races': value['Moto2Races'] ?? 'N/A',
            'Moto2Poles': value['Moto2Poles'] ?? 'N/A',
            'Moto2Podiums': value['Moto2Podiums'] ?? 'N/A',
            'Moto2Victories': value['Moto2Victories'] ?? 'N/A',
            'Moto2WorldChampionships':
                value['Moto2WorldChampionships'] ?? 'N/A',
            'Moto3Races': value['Moto3Races'] ?? 'N/A',
            'Moto3Poles': value['Moto3Poles'] ?? 'N/A',
            'Moto3Podiums': value['Moto3Podiums'] ?? 'N/A',
            'Moto3Victories': value['Moto3Victories'] ?? 'N/A',
            'Moto3WorldChampionships':
                value['Moto3WorldChampionships'] ?? 'N/A',
            'TeamMateImage': value['TeamMateImage'] ?? 'N/A',
            'TeamMateName': value['TeamMateName'] ?? 'N/A',
          };
          ridersMap[key] = riderData; // Update ridersMap without overwriting
          ridersListMoto2WildcardsAndTestRiders.add(riderData);
        });
      }
    });
  }

  Future<void> fetchResultMoto2RAC() async {
    DatabaseReference resultsRef = _databaseReference.child(
        'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/Moto2/RAC');

    resultsRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        print('Data received: ${snapshot.value}');
        if (snapshot.value is List) {
          List<dynamic> resultsList =
              List<dynamic>.from(snapshot.value as List);
          resultsMoto2RAC.clear();

          for (int i = 1; i < resultsList.length; i++) {
            var result = resultsList[i];
            if (result is Map) {
              String riderId = result['Id'] ?? 'N/A';

              // Fetch rider details from combined ridersMap
              Map<String, dynamic> riderDetails = ridersMap[riderId] ??
                  {
                    'Id': riderId,
                    'ImageCountry': 'N/A',
                    'Country': 'N/A',
                    'ImageRacer': '',
                    'Name': 'N/A',
                    'Team': 'N/A',
                    'Position': 'N/A',
                    'Points': 'N/A',
                    'Victories': 'N/A',
                    'TotalPodiums': 'N/A',
                    'TotalPoles': 'N/A',
                    'TotalRaces': 'N/A',
                    'TotalVictories': 'N/A',
                    'TotalWorldChampionships': 'N/A',
                    'MotoGPRaces': 'N/A',
                    'MotoGPPoles': 'N/A',
                    'MotoGPPodiums': 'N/A',
                    'MotoGPVictories': 'N/A',
                    'MotoGPWorldChampionships': 'N/A',
                    'Moto2Races': 'N/A',
                    'Moto2Poles': 'N/A',
                    'Moto2Podiums': 'N/A',
                    'Moto2Victories': 'N/A',
                    'Moto2WorldChampionships': 'N/A',
                    'Moto3Races': 'N/A',
                    'Moto3Poles': 'N/A',
                    'Moto3Podiums': 'N/A',
                    'Moto3Victories': 'N/A',
                    'Moto3WorldChampionships': 'N/A',
                    'TeamMateImage': 'N/A',
                    'TeamMateName': 'N/A',
                  };

              resultsMoto2RAC.add({
                'id': i.toString(),
                'Id': riderId,
                'Points': result['Points'] ?? 'N/A',
                'Time': result['Time'] ?? 'N/A',
                'RiderDetails': riderDetails,
              });
            }
          }
        } else {
          print('Unexpected data format: ${snapshot.value.runtimeType}');
        }
      }
    }).catchError((error) {
      print('Error fetching results: $error');
    });
  }

  Future<void> fetchRidersresultMoto2RACAdd() async {
    DatabaseReference resultsRef = _databaseReference.child(
        'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/Moto2/RACADD');

    resultsRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        print('Data received: ${snapshot.value}');
        if (snapshot.value is Map) {
          Map<String, dynamic> resultsMap =
              Map<String, dynamic>.from(snapshot.value as Map);
          resultsMoto2RACAdd.clear();

          resultsMap.forEach((key, value) {
            var result = value;
            if (result is Map) {
              String riderId = result['Id'] ?? 'N/A';

              // Fetch rider details from combined ridersMap
              Map<String, dynamic> riderDetails = ridersMap[riderId] ??
                  {
                    'Id': riderId,
                    'ImageCountry': 'N/A',
                    'Country': 'N/A',
                    'ImageRacer': '',
                    'Name': 'N/A',
                    'Team': 'N/A',
                    'Position': 'N/A',
                    'Points': 'N/A',
                    'Victories': 'N/A',
                    'TotalPodiums': 'N/A',
                    'TotalPoles': 'N/A',
                    'TotalRaces': 'N/A',
                    'TotalVictories': 'N/A',
                    'TotalWorldChampionships': 'N/A',
                    'MotoGPRaces': 'N/A',
                    'MotoGPPoles': 'N/A',
                    'MotoGPPodiums': 'N/A',
                    'MotoGPVictories': 'N/A',
                    'MotoGPWorldChampionships': 'N/A',
                    'Moto2Races': 'N/A',
                    'Moto2Poles': 'N/A',
                    'Moto2Podiums': 'N/A',
                    'Moto2Victories': 'N/A',
                    'Moto2WorldChampionships': 'N/A',
                    'Moto3Races': 'N/A',
                    'Moto3Poles': 'N/A',
                    'Moto3Podiums': 'N/A',
                    'Moto3Victories': 'N/A',
                    'Moto3WorldChampionships': 'N/A',
                    'TeamMateImage': 'N/A',
                    'TeamMateName': 'N/A',
                  };

              resultsMoto2RACAdd.add({
                'id': key,
                'Id': riderId,
                'Points': result['Points'] ?? 'N/A',
                'Time': result['Time'] ?? 'N/A',
                'RiderDetails': riderDetails,
              });
            }
          });
        } else {
          print('Unexpected data format: ${snapshot.value.runtimeType}');
        }
      }
    }).catchError((error) {
      print('Error fetching results: $error');
    });
  }
}
