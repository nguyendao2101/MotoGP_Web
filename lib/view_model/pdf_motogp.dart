import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../model/to_pdf_motogp.dart';
// Import ExcelService để ghi Excel

class PdfMotogp extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  RxList<Map<String, dynamic>> ridersMotoGP = <Map<String, dynamic>>[].obs;
  Map<String, Map<String, dynamic>> ridersMap = {};
  final ExcelService excelService =
      ExcelService(); // Tạo instance của ExcelService

  @override
  void onInit() {
    super.onInit();
    fetchRidersMotoGP(); // Lấy dữ liệu khi controller khởi tạo
  }

  Future<void> fetchRidersMotoGP() async {
    DatabaseReference officialRidersRef = _databaseReference.child(
        'Results&Standings/Standings/2024/RidersChampionship/PDF/MotoGP/Riders');

    officialRidersRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        Map<String, dynamic> ridersMapData =
            Map<String, dynamic>.from(snapshot.value as Map);
        ridersMotoGP.clear();
        ridersMapData.forEach((key, value) {
          Map<String, dynamic> riderData = {
            'id': key,
            'Country': value['Country'] ?? 'N/A',
            'Name': value['Name'] ?? 'N/A',
            'QATGP': value['QATGP'] ?? 'N/A',
            'QATSR': value['QATSR'] ?? 'N/A',
            'QATTotal': value['QATTotal'] ?? 'N/A',
            'AMEGP': value['AMEGP'] ?? 'N/A',
            'AMESR': value['AMESR'] ?? 'N/A',
            'AMETotal': value['AMETotal'] ?? 'N/A',
            'Leader': value['Leader'] ?? 'N/A',
            'PORGP': value['PORGP'] ?? 'N/A',
            'PORSR': value['PORSR'] ?? 'N/A',
            'PORToltal': value['PORToltal'] ?? 'N/A',
            'Points': value['Points'] ?? 'N/A',
            'Prev': value['Prev'] ?? 'N/A',
          };
          ridersMap[key] = riderData; // Cập nhật ridersMap
          ridersMotoGP.add(riderData);
        });

        // Gọi hàm ghi Excel sau khi có dữ liệu từ Firebase
        excelService.updateExistingExcel(ridersMotoGP);
      }
    });
  }
}
