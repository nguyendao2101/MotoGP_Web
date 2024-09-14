import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ResultsAndStandingsViewModel extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  RxList<Map<String, dynamic>> resultsMotoGPRAC = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchResultMotoGPRAC();
  }

  //results&standings/results/motogp/rac
  Future<void> fetchResultMotoGPRAC() async {
    DatabaseReference officialRidersRef = _databaseReference.child(
        'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/MotoGP/RAC');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> ridersMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        resultsMotoGPRAC.clear();
        ridersMap.forEach((key, value) {
          resultsMotoGPRAC.add({
            'id': key,
            'Id': value['Id'] ?? 'N/A',
            'Points': value['Points'] ?? 'N/A',
            'Time': value['Time'] ?? 'N/A',
          });
        });
      }
    });
  }
}
