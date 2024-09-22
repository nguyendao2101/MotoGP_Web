// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class RidersAndTeamsViewModels extends GetxController {
//   final txtSearch = TextEditingController().obs;
//   final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
//   RxList<Map<String, dynamic>> ridersListMotoGP = <Map<String, dynamic>>[].obs;
//   RxList<Map<String, dynamic>> ridersListMotoGPSubstitute =
//       <Map<String, dynamic>>[].obs;
//   RxList<Map<String, dynamic>> ridersListMotoGPWildCardsAndTestRiders =
//       <Map<String, dynamic>>[].obs;
//   RxList<Map<String, dynamic>> resultsMotoGPRAC = <Map<String, dynamic>>[].obs;
//   RxList<Map<String, dynamic>> resultsMotoGPWUP = <Map<String, dynamic>>[].obs;
//   RxList<Map<String, dynamic>> ridersStatsTotalMotoGP =
//       <Map<String, dynamic>>[].obs;

//   // Temporary storage for rider details
//   Map<String, Map<String, dynamic>> ridersMap = {};

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRidersMotoGP();
//     fetchRidersMotoGPSubstitute();
//     fetchRidersMotoGPWildCardsAndTestRiders();
//     fetchRidersStatsTotalMotoGP();
//     fetchResultMotoGPRAC();
//     fetchResultMotoGPWUP();
//   }

//   dynamic zeroToSpace(dynamic input) {
//     if (input == 0) {
//       input = ' '; // Thay đổi giá trị trực tiếp trong danh sách
//     }
//     return input;
//   }

//   String extractNumbers(String input) {
//     // Sử dụng regex để tìm tất cả các chữ số trong chuỗi
//     RegExp regExp = RegExp(r'\d+');
//     Iterable<RegExpMatch> matches = regExp.allMatches(input);
//     return matches.map((m) => m.group(0)).join();
//   }

//   // Fetch MotoGP riders' data and store in ridersMap
//   Future<void> fetchRidersMotoGP() async {
//     DatabaseReference officialRidersRef =
//         _databaseReference.child('Riders&Team/Riders/MotoGP/Official');

//     officialRidersRef.once().then((DatabaseEvent event) {
//       DataSnapshot snapshot = event.snapshot;
//       if (snapshot.value != null) {
//         Map<String, dynamic> ridersMapData =
//             Map<String, dynamic>.from(snapshot.value as Map);
//         ridersListMotoGP.clear();
//         ridersMapData.forEach((key, value) {
//           Map<String, dynamic> riderData = {
//             'id': key,
//             'ImageCountry': value['ImageCountry'] ?? 'N/A',
//             'Country': value['Country'] ?? 'N/A',
//             'Id': value['Id'] ?? 'N/A',
//             'ImageRacer': value['ImageRacer'] ?? '',
//             'Name': value['Name'] ?? 'N/A',
//             'Team': value['Team'] ?? 'N/A',
//             'Position': value['Position'] ?? 'N/A',
//             'Points': value['Points'] ?? 'N/A',
//             'Victories': value['Victories'] ?? 'N/A',
//           };
//           ridersMap[key] = riderData; // Update ridersMap without overwriting
//           ridersListMotoGP.add(riderData);
//         });
//       }
//     });
//   }

//   Future<void> fetchRidersStatsTotalMotoGP() async {
//     DatabaseReference officialRidersRef =
//         _databaseReference.child('Riders&Team/Riders/RidersStats/Total/MotoGP');

//     print('Fetching MotoGP riders stats from database...');

//     officialRidersRef.once().then((DatabaseEvent event) {
//       DataSnapshot snapshot = event.snapshot;
//       print('Database event received.');

//       if (snapshot.value != null) {
//         print('Data received: ${snapshot.value}');
//         Map<String, dynamic> ridersMapData =
//             Map<String, dynamic>.from(snapshot.value as Map);
//         ridersStatsTotalMotoGP.clear();

//         print('Processing riders data...');
//         // Duyệt qua các nhánh con như AE11, AE12...
//         ridersMapData.forEach((key, value) {
//           if (value is Map<String, dynamic>) {
//             // Đọc dữ liệu từ từng nhánh con
//             Map<String, dynamic> riderData = {
//               'id': key,
//               'Id': value['Id'] ?? 'N/A',
//               'Podiums': value['Podiums'] ?? 'N/A',
//               'Races': value['Races'] ?? 'N/A',
//               'Poles': value['Poles'] ?? 'N/A',
//               'Victories': value['Victories'] ?? 'N/A',
//               'WorldChampionships': value['WorldChampionships'] ?? 'N/A',
//             };

//             // Lưu vào ridersMap và ridersStatsTotalMotoGP
//             print('Adding rider data: $riderData');
//             ridersMap[key] = riderData;
//             ridersStatsTotalMotoGP.add(riderData);
//           }
//         });

//         print('Data processing complete.');
//       } else {
//         print('No data found.');
//       }
//     }).catchError((error) {
//       print('Error fetching riders stats: $error');
//     });
//   }

//   //riders&teams/riders/motogp/substitute
//   Future<void> fetchRidersMotoGPSubstitute() async {
//     DatabaseReference substituteRidersRef =
//         _databaseReference.child('Riders&Team/Riders/MotoGP/Substitute');

//     substituteRidersRef.once().then((DatabaseEvent event) {
//       DataSnapshot snapshot = event.snapshot;
//       if (snapshot.value != null) {
//         Map<String, dynamic> substituteRidersMap =
//             Map<String, dynamic>.from(snapshot.value as Map);
//         ridersListMotoGPSubstitute.clear();
//         substituteRidersMap.forEach((key, value) {
//           Map<String, dynamic> riderData = {
//             'id': key,
//             'ImageCountry': value['ImageCountry'] ?? 'N/A',
//             'Country': value['Country'] ?? 'N/A',
//             'Id': value['Id'] ?? 'N/A',
//             'ImageRacer': value['ImageRacer'] ?? '',
//             'Name': value['Name'] ?? 'N/A',
//             'Team': value['Team'] ?? 'N/A',
//             'Position': value['Position'] ?? 'N/A',
//             'Points': value['Points'] ?? 'N/A',
//             'Victories': value['Victories'] ?? 'N/A',
//           };
//           ridersMap[key] = riderData; // Append to the existing ridersMap
//           ridersListMotoGPSubstitute.add(riderData);
//         });
//       }
//     });
//   }

//   //riders&teams/riders/motogp/wildcardsandtestriders
//   Future<void> fetchRidersMotoGPWildCardsAndTestRiders() async {
//     DatabaseReference wildcardsRef = _databaseReference
//         .child('Riders&Team/Riders/MotoGP/WildcardsAndTestRiders');

//     wildcardsRef.once().then((DatabaseEvent event) {
//       DataSnapshot snapshot = event.snapshot;
//       if (snapshot.value != null) {
//         Map<String, dynamic> wildcardRidersMap =
//             Map<String, dynamic>.from(snapshot.value as Map);
//         ridersListMotoGPWildCardsAndTestRiders.clear();
//         wildcardRidersMap.forEach((key, value) {
//           Map<String, dynamic> riderData = {
//             'id': key,
//             'ImageCountry': value['ImageCountry'] ?? 'N/A',
//             'Country': value['Country'] ?? 'N/A',
//             'Id': value['Id'] ?? 'N/A',
//             'ImageRacer': value['ImageRacer'] ?? '',
//             'Name': value['Name'] ?? 'N/A',
//             'Team': value['Team'] ?? 'N/A',
//             'Position': value['Position'] ?? 'N/A',
//             'Points': value['Points'] ?? 'N/A',
//             'Victories': value['Victories'] ?? 'N/A',
//           };
//           ridersMap[key] = riderData; // Append to ridersMap
//           ridersListMotoGPWildCardsAndTestRiders.add(riderData);
//         });
//       }
//     });
//   }

//   Future<void> fetchResultMotoGPRAC() async {
//     DatabaseReference resultsRef = _databaseReference.child(
//         'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/MotoGP/RAC');

//     resultsRef.once().then((DatabaseEvent event) {
//       DataSnapshot snapshot = event.snapshot;
//       if (snapshot.value != null) {
//         print('Data received: ${snapshot.value}');
//         if (snapshot.value is List) {
//           List<dynamic> resultsList =
//               List<dynamic>.from(snapshot.value as List);
//           resultsMotoGPRAC.clear();

//           for (int i = 1; i < resultsList.length; i++) {
//             var result = resultsList[i];
//             if (result is Map) {
//               String riderId = result['Id'] ?? 'N/A';

//               // Fetch rider details from combined ridersMap
//               Map<String, dynamic> riderDetails = ridersMap[riderId] ??
//                   {
//                     'Id': riderId,
//                     'ImageCountry': 'N/A',
//                     'Country': 'N/A',
//                     'ImageRacer': '',
//                     'Name': 'N/A',
//                     'Team': 'N/A',
//                     'Position': 'N/A',
//                     'Points': 'N/A',
//                     'Victories': 'N/A',
//                   };

//               resultsMotoGPRAC.add({
//                 'id': i.toString(),
//                 'Id': riderId,
//                 'Points': result['Points'] ?? 'N/A',
//                 'Time': result['Time'] ?? 'N/A',
//                 'RiderDetails': riderDetails,
//               });
//             }
//           }
//         } else {
//           print('Unexpected data format: ${snapshot.value.runtimeType}');
//         }
//       }
//     }).catchError((error) {
//       print('Error fetching results: $error');
//     });
//   }

//   Future<void> fetchResultMotoGPWUP() async {
//     DatabaseReference resultsRef = _databaseReference.child(
//         'Results&Standings/Results/2024/GrandsPrix/GRANPREMIODISANMARINOEDELLARIVIERADIRIMINI/MotoGP/WUP');

//     resultsRef.once().then((DatabaseEvent event) {
//       DataSnapshot snapshot = event.snapshot;
//       if (snapshot.value != null) {
//         print('Data received: ${snapshot.value}');
//         if (snapshot.value is List) {
//           List<dynamic> resultsList =
//               List<dynamic>.from(snapshot.value as List);
//           resultsMotoGPWUP.clear();

//           for (int i = 1; i < resultsList.length; i++) {
//             var result = resultsList[i];
//             if (result is Map) {
//               String riderId = result['Id'] ?? 'N/A';

//               // Fetch rider details from combined ridersMap
//               Map<String, dynamic> riderDetails = ridersMap[riderId] ??
//                   {
//                     'Id': riderId,
//                     'ImageCountry': 'N/A',
//                     'Country': 'N/A',
//                     'ImageRacer': '',
//                     'Name': 'N/A',
//                     'Team': 'N/A',
//                     'Position': 'N/A',
//                     'Points': 'N/A',
//                     'Victories': 'N/A',
//                   };

//               resultsMotoGPWUP.add({
//                 'id': i.toString(),
//                 'Id': riderId,
//                 'Gap': result['Gap'] ?? 'N/A',
//                 'Time': result['Time'] ?? 'N/A',
//                 'RiderDetails': riderDetails,
//               });
//             }
//           }
//         } else {
//           print('Unexpected data format: ${snapshot.value.runtimeType}');
//         }
//       }
//     }).catchError((error) {
//       print('Error fetching results: $error');
//     });
//   }
// }
