// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

// Import ExcelService để ghi Excel

class PdfMotogp extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  RxList<Map<String, dynamic>> ridersMotoGP = <Map<String, dynamic>>[].obs;
  Map<String, Map<String, dynamic>> ridersMap = {};
  @override
  void onInit() {
    super.onInit();
    fetchRidersMotoGP(); // Lấy dữ liệu khi controller khởi tạo
  }

  Future<void> fetchRidersMotoGP() async {
    DatabaseReference calendarRef = _databaseReference.child(
        'Results&Standings/Standings/2024/RidersChampionship/PDF/MotoGP/Riders');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        ridersMotoGP.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
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
              'SPAGP': value['SPAGP'] ?? 'N/A',
              'SPASR': value['SPASR'] ?? 'N/A',
              'SPATotal': value['SPATotal'] ?? 'N/A',
              'FRAGP': value['FRAGP'] ?? 'N/A',
              'FRASR': value['FRASR'] ?? 'N/A',
              'FRATotal': value['FRATotal'] ?? 'N/A',
              'CATGP': value['CATGP'] ?? 'N/A',
              'CATSR': value['CATSR'] ?? 'N/A',
              'CATTotal': value['CATTotal'] ?? 'N/A',
              'ITAGP': value['ITAGP'] ?? 'N/A',
              'ITASR': value['ITASR'] ?? 'N/A',
              'ITATotal': value['ITATotal'] ?? 'N/A',
              'NEDGP': value['NEDGP'] ?? 'N/A',
              'NEDSR': value['NEDSR'] ?? 'N/A',
              'NEDTotal': value['NEDTotal'] ?? 'N/A',
              'GERGP': value['GERGP'] ?? 'N/A',
              'GERSR': value['GERSR'] ?? 'N/A',
              'GERTotal': value['GERTotal'] ?? 'N/A',
              'GBRGP': value['GBRGP'] ?? 'N/A',
              'GBRSR': value['GBRSR'] ?? 'N/A',
              'GBRTotal': value['GBRTotal'] ?? 'N/A',
              'AUTGP': value['AUTGP'] ?? 'N/A',
              'AUTSR': value['AUTSR'] ?? 'N/A',
              'AUTTotal': value['AUTTotal'] ?? 'N/A',
              'ARAGP': value['ARAGP'] ?? 'N/A',
              'ARASR': value['ARASR'] ?? 'N/A',
              'ARATotal': value['ARATotal'] ?? 'N/A',
              'RSMGP': value['RSMGP'] ?? 'N/A',
              'RSMSR': value['RSMSR'] ?? 'N/A',
              'RSMTotal': value['RSMTotal'] ?? 'N/A',
              'EMIGP': value['EMIGP'] ?? 'N/A',
              'EMISR': value['EMISR'] ?? 'N/A',
              'EMITotal': value['EMITotal'] ?? 'N/A',
              'INAGP': value['INAGP'] ?? 'N/A',
              'INASR': value['INASR'] ?? 'N/A',
              'INATotal': value['INATotal'] ?? 'N/A',
              'JPNGP': value['JPNGP'] ?? 'N/A',
              'JPNSR': value['JPNSR'] ?? 'N/A',
              'JPNTotal': value['JPNTotal'] ?? 'N/A',
            };

            ridersMotoGP.add(calendarData); // Thêm vào danh sách
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
