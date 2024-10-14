// ignore_for_file: avoid_web_libraries_in_flutter, prefer_typing_uninitialized_variables, invalid_use_of_protected_member, unused_local_variable, deprecated_member_use, use_build_context_synchronously, avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moto_gp_web/widgets/common/image_extention.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html; // Chỉ dùng cho nền tảng web

class TableStandingsDetail extends StatelessWidget {
  final controller;
  final RxList<Map<String, dynamic>> listDS;

  const TableStandingsDetail({
    super.key,
    this.controller,
    required this.listDS,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Lấy danh sách kết quả
      final resultsList = listDS.value;

      // Kiểm tra nếu danh sách rỗng
      if (resultsList.isEmpty) {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        // Sắp xếp danh sách theo điểm số giảm dần
        resultsList.sort((a, b) => b['Points'].compareTo(a['Points']));

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0, // Bo viền cho bảng
                        ),
                        borderRadius: BorderRadius.circular(8.0), // Bo góc
                      ),
                      child: SingleChildScrollView(
                        // Thêm ScrollView nếu bảng lớn
                        child: Table(
                          border: TableBorder.all(
                            color: Colors.black, // Màu của đường viền
                            width: 2.0, // Độ dày của đường viền
                          ),
                          columnWidths: const {
                            0: FlexColumnWidth(2), // Cột Tên
                            1: FlexColumnWidth(1), // Cột Điểm
                            2: FlexColumnWidth(1), // Cột Quốc gia
                            3: FlexColumnWidth(1), // Cột Quốc gia
                            4: FlexColumnWidth(1), // Cột Quốc gia
                            5: FlexColumnWidth(1), // Cột Quốc gia
                            6: FlexColumnWidth(1), // Cột Quốc gia
                            7: FlexColumnWidth(1), // CCột Quốc gia
                            8: FlexColumnWidth(1), // Cột Quốc gia
                            9: FlexColumnWidth(1), // Cột Quốc gia
                            10: FlexColumnWidth(1), // Cột Quốc gia
                            11: FlexColumnWidth(1), // Cột Quốc gia
                            12: FlexColumnWidth(1), // Cột Quốc gia
                            13: FlexColumnWidth(1), // Cột Quốc gia
                            14: FlexColumnWidth(1), // Cột Quốc gia
                            15: FlexColumnWidth(1), // Cột Quốc gia
                            16: FlexColumnWidth(1), // Cột Quốc gia
                            17: FlexColumnWidth(1), // Cột Quốc gia
                            18: FlexColumnWidth(1), // Cột Quốc gia
                            19: FlexColumnWidth(1), // Cột Quốc gia
                          },
                          children: [
                            // Hàng tiêu đề
                            const TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Rider',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Points',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Leader',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Prev',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('QAT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('POR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('AME',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('SPA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('FRA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('CAT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('ITA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('NED',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('GER',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('GBR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('AUT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('ARA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('RSM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('EMI',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('INA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('JPN',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            // Các hàng dữ liệu
                            for (var result in resultsList)
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          result['Name'] ?? 'Không có tên',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text('[${result['Country']}]')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                          result['Points']?.toString() ?? '0'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                          result['Leader']?.toString() ?? '0'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                            result['Prev']?.toString() ?? '0')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['QATTotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['QATSR']?.toString() ??
                                                '0'),
                                            Text(result['QATGP']?.toString() ??
                                                '0')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['PORTotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['PORSR']?.toString() ??
                                                '0'),
                                            Text(result['PORGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['AMETotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['AMESR']?.toString() ??
                                                '0'),
                                            Text(result['AMEGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['SPATotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['SPASR']?.toString() ??
                                                '0'),
                                            Text(result['SPAGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['FRATotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['FRASR']?.toString() ??
                                                '0'),
                                            Text(result['FRAGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['CATTotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['CATSR']?.toString() ??
                                                '0'),
                                            Text(result['CATGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['ITATotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['ITASR']?.toString() ??
                                                '0'),
                                            Text(result['ITAGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['NEDTotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['NEDSR']?.toString() ??
                                                '0'),
                                            Text(result['NEDGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['GERTotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['GERSR']?.toString() ??
                                                '0'),
                                            Text(result['GERGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['GBRTotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['GBRSR']?.toString() ??
                                                '0'),
                                            Text(result['GBRGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['AUTTotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['AUTSR']?.toString() ??
                                                '0'),
                                            Text(result['AUTGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['ARATotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['ARASR']?.toString() ??
                                                '0'),
                                            Text(result['ARAGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['RSMTotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['RSMSR']?.toString() ??
                                                '0'),
                                            Text(result['RSMGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['EMITotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['EMISR']?.toString() ??
                                                '0'),
                                            Text(result['EMIGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['INATotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['INASR']?.toString() ??
                                                '0'),
                                            Text(result['INAGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(result['JPNTotal']?.toString() ??
                                            '0'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(result['JPNSR']?.toString() ??
                                                '0'),
                                            Text(result['JPNGP']?.toString() ??
                                                '0'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),

                    // Nút tải xuống PDF
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.download),
                        label: const Text('Tải xuống PDF'),
                        onPressed: () {
                          exportToPDF(context, resultsList);
                        },
                      ),
                    ),
                  ],
                );
              },
              childCount: 1, // Chỉ có một DataTable
            ),
          ),
        );
      }
    });
  }

  // Hàm tạo file PDF
  Future<void> exportToPDF(
      BuildContext context, List<Map<String, dynamic>> resultsList) async {
    final pdf = pw.Document();

    // Tải hình ảnh từ assets (replace 'assets/logo.png' with your image path)
    final Uint8List imageData = await rootBundle
        .load(ImageAssest.pdfMotogp)
        .then((data) => data.buffer.asUint8List());

    final image = pw.MemoryImage(imageData);

    // Tạo dữ liệu cho bảng PDF
    final List<List<dynamic>> data = [
      [
        'Rider',
        'Points',
        'Leader',
        'Prev',
        'QAT',
        'POR',
        'AME',
        'SPA',
        'FRA',
        'CAT',
        'ITA',
        'NED',
        'GER',
        'GBR',
        'AUT',
        'ARA',
        'RSM',
        'EMI',
        'INA',
        'JPN',
      ] // Header
    ];

    for (var result in resultsList) {
      data.add([
        '${result['Name'] ?? 'Không có tên'} [${result['Country'] ?? 'Không có quốc gia'}]',
        result['Points']?.toString() ?? '0',
        result['Leader']?.toString() ?? '0',
        result['Prev']?.toString() ?? '0',
        '${result['QATTotal']?.toString() ?? '0'}\n ${result['QATSR']?.toString() ?? '0'} ${result['QATGP']?.toString() ?? '0'}',
        '${result['PORTotal']?.toString() ?? '0'}\n ${result['PORSR']?.toString() ?? '0'} ${result['PORGP']?.toString() ?? '0'}',
        '${result['AMETotal']?.toString() ?? '0'}\n ${result['AMESR']?.toString() ?? '0'} ${result['AMEGP']?.toString() ?? '0'}',
        '${result['SPATotal']?.toString() ?? '0'}\n ${result['SPASR']?.toString() ?? '0'} ${result['SPAGP']?.toString() ?? '0'}',
        '${result['FRATotal']?.toString() ?? '0'}\n ${result['FRASR']?.toString() ?? '0'} ${result['FRAGP']?.toString() ?? '0'}',
        '${result['CATTotal']?.toString() ?? '0'}\n ${result['CATSR']?.toString() ?? '0'} ${result['CATGP']?.toString() ?? '0'}',
        '${result['ITATotal']?.toString() ?? '0'}\n ${result['ITASR']?.toString() ?? '0'} ${result['ITAGP']?.toString() ?? '0'}',
        '${result['NEDTotal']?.toString() ?? '0'}\n ${result['NEDSR']?.toString() ?? '0'} ${result['NEDGP']?.toString() ?? '0'}',
        '${result['GERTotal']?.toString() ?? '0'}\n ${result['GERSR']?.toString() ?? '0'} ${result['GERGP']?.toString() ?? '0'}',
        '${result['GBRTotal']?.toString() ?? '0'}\n ${result['GBRSR']?.toString() ?? '0'} ${result['GBRGP']?.toString() ?? '0'}',
        '${result['AUTTotal']?.toString() ?? '0'}\n ${result['AUTSR']?.toString() ?? '0'} ${result['AUTGP']?.toString() ?? '0'}',
        '${result['ARATotal']?.toString() ?? '0'}\n ${result['ARASR']?.toString() ?? '0'} ${result['ARAGP']?.toString() ?? '0'}',
        '${result['RSMTotal']?.toString() ?? '0'}\n ${result['RSMSR']?.toString() ?? '0'} ${result['RSMGP']?.toString() ?? '0'}',
        '${result['EMITotal']?.toString() ?? '0'}\n ${result['EMISR']?.toString() ?? '0'} ${result['EMIGP']?.toString() ?? '0'}',
        '${result['INATotal']?.toString() ?? '0'}\n ${result['INASR']?.toString() ?? '0'} ${result['INAGP']?.toString() ?? '0'}',
        '${result['JPNTotal']?.toString() ?? '0'}\n ${result['JPNSR']?.toString() ?? '0'} ${result['JPNGP']?.toString() ?? '0'}',
      ]);
    }

    // Thêm trang với hình ảnh ở đầu
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Image(image, height: 250), // Thêm ảnh vào đầu trang
              pw.SizedBox(height: 20), // Khoảng cách giữa ảnh và bảng
              pw.Table.fromTextArray(
                context: context,
                headers: data[0],
                data: data.sublist(1),
                border: pw.TableBorder.all(), // Thêm viền cho bảng
                cellAlignment: pw.Alignment.center,
                headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 5, // Giảm kích thước chữ của tiêu đề
                ),
                cellStyle: const pw.TextStyle(
                  fontSize: 3, // Giảm kích thước chữ của các ô dữ liệu
                ),
              ),
            ],
          );
        },
      ),
    );

    try {
      final bytes = await pdf.save();

      if (kIsWeb) {
        final blob = html.Blob([bytes], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", "Championship_2024_rider.pdf")
          ..click();
        html.Url.revokeObjectUrl(url);

        // Hiển thị thông báo khi tải file thành công
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File PDF đã được tải xuống')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Không hỗ trợ lưu file trên nền tảng này!')),
        );
      }
    } catch (e) {
      print("Lỗi khi xuất PDF: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không thể xuất PDF: $e')),
      );
    }
  }
}
