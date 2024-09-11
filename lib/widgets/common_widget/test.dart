// import 'package:flutter/material.dart';

// class RidersAndTeamsRidersMotogp extends StatefulWidget {
//   const RidersAndTeamsRidersMotogp({super.key});

//   @override
//   State<RidersAndTeamsRidersMotogp> createState() =>
//       _RidersAndTeamsRidersMotogpState();
// }

// class _RidersAndTeamsRidersMotogpState
//     extends State<RidersAndTeamsRidersMotogp> {
//   final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
//   List<Map<String, dynamic>> ridersList = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchRiders();
//   }

//   void _fetchRiders() async {
//     DatabaseReference officialRidersRef =
//         _databaseReference.child('Riders&Team/Riders/MotoGP/Official');

//     officialRidersRef.once().then((DatabaseEvent event) {
//       DataSnapshot snapshot = event.snapshot;
//       if (snapshot.value != null) {
//         Map<String, dynamic> ridersMap =
//             Map<String, dynamic>.from(snapshot.value as Map);
//         setState(() {
//           // Duyệt qua từng rider trong `Official` và thêm vào danh sách `ridersList`
//           ridersMap.forEach((key, value) {
//             ridersList.add({
//               'id': key,
//               'Country': value['Country'] ?? 'N/A',
//               'Id': value['Id'] ?? 'N/A',
//               'ImageRacer': value['ImageRacer'] ?? '',
//               'Name': value['Name'] ?? 'N/A',
//               'Team': value['Team'] ?? 'N/A',
//             });
//           });
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Danh sách tay đua'),
//       ),
//       body: ridersList.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4, // Số lượng cột tối đa
//                 crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
//                 mainAxisSpacing: 8.0, // Khoảng cách giữa các hàng
//               ),
//               padding: EdgeInsets.all(8.0),
//               itemCount: ridersList.length,
//               itemBuilder: (context, index) {
//                 var rider = ridersList[index];
//                 return GridTile(
//                   footer: Container(
//                     color: Colors.black54, // Nền màu tối cho footer
//                     padding: EdgeInsets.all(4.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           rider['Name'],
//                           style: TextStyle(color: Colors.white),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           'Team: ${rider['Team']}',
//                           style: TextStyle(color: Colors.white),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       Container(
//                         color: Colors.grey[300], // Màu nền cố định cho ảnh
//                       ),
//                       rider['ImageRacer'] != ''
//                           ? Image.network(
//                               rider['ImageRacer'],
//                               fit: BoxFit.cover,
//                             )
//                           : Icon(Icons.person, size: 50, color: Colors.grey),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

// class RiderDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> rider;

//   RiderDetailScreen({required this.rider});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(rider['Name']),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 16),
//             Text('Country: ${rider['Country']}',
//                 style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Text('Id: ${rider['Id']}', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Text('Team: ${rider['Team']}', style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }
