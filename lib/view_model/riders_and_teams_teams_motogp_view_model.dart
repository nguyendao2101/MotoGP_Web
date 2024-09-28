import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class RidersAndTeamsTeamsMotogpViewModel extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  RxList<Map<String, dynamic>> ridersListMotoGP = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ridersListMotoGPSubstitute =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ridersListMotoGPWildCardsAndTestRiders =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> teamsMotoGP = <Map<String, dynamic>>[].obs;

// Temporary storage for rider details
  Map<String, Map<String, dynamic>> ridersMap = {};

  @override
  void onInit() {
    super.onInit();
    fetchRidersMotoGP();
    fetchRidersMotoGPSubstitute();
    fetchRidersMotoGPWildCardsAndTestRiders();
    fetchTeamsMotoGP();
  }

// Fetch MotoGP riders' data and store in ridersMap
  Future<void> fetchRidersMotoGP() async {
    DatabaseReference officialRidersRef =
        _databaseReference.child('Riders&Team/Riders/MotoGP/Official');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        print('day la tu teams: ${snapshot.value}');
        Map<String, dynamic> ridersMapData =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMotoGP.clear();
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
          ridersListMotoGP.add(riderData);
        });
      }
    });
  }

  //riders&teams/riders/motogp/substitute
  Future<void> fetchRidersMotoGPSubstitute() async {
    DatabaseReference substituteRidersRef =
        _databaseReference.child('Riders&Team/Riders/MotoGP/Substitute');

    substituteRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> substituteRidersMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMotoGPSubstitute.clear();
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
          ridersListMotoGPSubstitute.add(riderData);
        });
      }
    });
  }

  //riders&teams/riders/motogp/wildcardsandtestriders
  Future<void> fetchRidersMotoGPWildCardsAndTestRiders() async {
    DatabaseReference wildcardsRef = _databaseReference
        .child('Riders&Team/Riders/MotoGP/WildcardsAndTestRiders');

    wildcardsRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> wildcardRidersMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersListMotoGPWildCardsAndTestRiders.clear();
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
          ridersListMotoGPWildCardsAndTestRiders.add(riderData);
        });
      }
    });
  }

  Future<void> fetchTeamsMotoGP() async {
    DatabaseReference resultsRef =
    _databaseReference.child('Riders&Team/Teams/MotoGP');

    resultsRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        print('teams motogp: ${snapshot.value}');
        // Kiểm tra nếu dữ liệu là Map
        if (snapshot.value is Map) {
          print('Dữ liệu là Map');
          Map<dynamic, dynamic> resultsMap =
          Map<dynamic, dynamic>.from(snapshot.value as Map);
          teamsMotoGP.clear();

          resultsMap.forEach((key, result) {
            if (result is Map) {
              String riderId = result['Id'] ?? 'N/A';

              // Fetch rider details from combined ridersMap
              Map<String, dynamic> riderDetails = ridersMap[riderId] ?? {
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

              teamsMotoGP.add({
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
