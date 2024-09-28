import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class RidersAndTeamsTeamsMoto2ViewModel extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  RxList<Map<String, dynamic>> ridersListMoto2 = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ridersListMoto2Substitute =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ridersListMoto2WildCardsAndTestRiders =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> teamsMoto2 = <Map<String, dynamic>>[].obs;

// Temporary storage for rider details
  Map<String, Map<String, dynamic>> ridersMap = {};

  @override
  void onInit() {
    super.onInit();
    fetchRidersMoto2();
    fetchRidersMoto2Substitute();
    fetchRidersMoto2WildCardsAndTestRiders();
    fetchTeamsMoto2();
  }

// Fetch MotoGP riders' data and store in ridersMap
  Future<void> fetchRidersMoto2() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Riders&Team/Riders/Moto2/Official');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        print('day la tu teams: ${snapshot.value}');
        Map<String, dynamic> ridersMapData =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMoto2.clear();
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
          ridersListMoto2.add(riderData);
        });
      }
    });
  }

  //riders&teams/riders/motogp/substitute
  Future<void> fetchRidersMoto2Substitute() async {
    DatabaseReference substituteRidersRef =
        _databaseReference.child('Riders&Team/Riders/Moto2/Substitute');

    substituteRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> substituteRidersMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMoto2Substitute.clear();
        substituteRidersMap.forEach((key, value) {
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
          ridersMap[key] = riderData; // Append to the existing ridersMap
          ridersListMoto2Substitute.add(riderData);
        });
      }
    });
  }

  //riders&teams/riders/motogp/wildcardsandtestriders
  Future<void> fetchRidersMoto2WildCardsAndTestRiders() async {
    DatabaseReference wildcardsRef = _databaseReference
        .child('Riders&Team/Riders/Moto2/WildcardsAndTestRiders');

    wildcardsRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> wildcardRidersMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMoto2WildCardsAndTestRiders.clear();
        wildcardRidersMap.forEach((key, value) {
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
          ridersMap[key] = riderData; // Append to ridersMap
          ridersListMoto2WildCardsAndTestRiders.add(riderData);
        });
      }
    });
  }

  Future<void> fetchTeamsMoto2() async {
    DatabaseReference resultsRef =
        _databaseReference.child('Riders&Team/Teams/Moto2');

    resultsRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        print('teams motogp: ${snapshot.value}');
        // Kiểm tra nếu dữ liệu là Map
        if (snapshot.value is Map) {
          print('Dữ liệu là Map');
          Map<dynamic, dynamic> resultsMap =
              Map<dynamic, dynamic>.from(snapshot.value as Map);
          teamsMoto2.clear();

          resultsMap.forEach((key, result) {
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

              teamsMoto2.add({
                'id': key.toString(),
                'Id': riderId,
                'BikeManufacturer': result['BikeManufacturer'] ?? 'N/A',
                'Image': result['Image'] ?? 'N/A',
                'Rider1': result['Rider1'] ?? 'N/A',
                'Rider2': result['Rider2'] ?? 'N/A',
                'Team': result['Team'] ?? 'N/A',
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
