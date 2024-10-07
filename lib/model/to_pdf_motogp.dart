import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';

class ExcelService {
  Future<void> updateExistingExcel(
      List<Map<String, dynamic>> ridersList) async {
    // Load file Excel sẵn có từ assets
    ByteData data = await rootBundle.load('assets/Championship 2024.xlsx');
    var bytes = data.buffer.asUint8List();

    // Decode file Excel
    var excel = Excel.decodeBytes(bytes);
    // Truy cập sheet "Championship 2024-RIDERS"
    Sheet sheetObject = excel['Championship 2024-RIDERS'];

    // Cập nhật dữ liệu vào các ô cụ thể
    if (ridersList.isNotEmpty) {
      for (int i = 0; i < ridersList.length; i++) {
        Map<String, dynamic> rider = ridersList[i];

        // Cập nhật các ô với dữ liệu tương ứng
        sheetObject.updateCell(
            CellIndex.indexByString("B${7 + i}"), rider['Name']);
        sheetObject.updateCell(
            CellIndex.indexByString("B${8 + i}"), rider['Country']);
        sheetObject.updateCell(
            CellIndex.indexByString("C${7 + i}"), rider['Leader']);
        sheetObject.updateCell(
            CellIndex.indexByString("D${7 + i}"), rider['Prev']);
      }
    }

    // Lưu file Excel với thay đổi (ghi đè file gốc trong assets)
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/Championship 2024.xlsx';

    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    print('Dữ liệu đã được cập nhật và lưu vào file gốc tại $filePath');
  }
}
