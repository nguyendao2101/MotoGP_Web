import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widgets/common/color_extentionn.dart';
import '../widgets/common/image_extention.dart';

class InfoUserView extends StatefulWidget {
  const InfoUserView({super.key});

  @override
  State<InfoUserView> createState() => _InfoUserViewState();
}

class _InfoUserViewState extends State<InfoUserView> {
  late DatabaseReference _database;
  late String _userId;
  Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    _database = FirebaseDatabase.instance.ref();
    _initializeUserId();
  }

  void _initializeUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userId = user.uid;
      _getUserData();
    } else {}
  }

  void _getUserData() async {
    DatabaseReference userRef = _database.child('users/$_userId');
    DataSnapshot snapshot = await userRef.get();

    if (snapshot.exists) {
      setState(() {
        _userData = Map<String, dynamic>.from(snapshot.value as Map);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Color(0xFF3D0000)], // Các màu gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: ChatColor.background,
          elevation: 0,
          title: Text('User Information',
              style: TextStyle(
                  color: ChatColor.almond,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Row(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),
                      _buildProfileImage(),
                      const SizedBox(height: 150),
                      _buildUserInfoCard(),
                      const SizedBox(height: 500),
                      // _buildFavouriteMessagesCard(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width:
          110, // Kích thước tổng thể của hình đại diện (bằng với radius*2 + borderWidth)
      height: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ChatColor.almond, // Màu của viền ngoài
          width: 4.0, // Độ dày của viền ngoài
        ),
      ),
      child: CircleAvatar(
        radius: 50, // Kích thước của hình đại diện
        backgroundImage: AssetImage(ImageAssest.user),
        backgroundColor: ChatColor.background,
      ),
    );
  }

  Widget _buildUserInfoCard() {
    return _userData.isNotEmpty
        ? Card(
            color: ChatColor.gray1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserInfoRow('Full Name', _userData['fullName']),
                  const Divider(color: Colors.white24),
                  _buildUserInfoRow('Email', _userData['email']),
                  const Divider(color: Colors.white24),
                  _buildUserInfoRow('Address', _userData['address']),
                  const Divider(color: Colors.white24),
                  _buildUserInfoRow('Sex', _userData['sex']),
                ],
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
  }

  Widget _buildUserInfoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: ChatColor.almond,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value ?? '',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildFavouriteMessagesCard() {
  //   return _userData.isNotEmpty
  //       ? Card(
  //           color: ChatColor.gray1,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           elevation: 5,
  //           child: Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Favourite Messages',
  //                   style: TextStyle(
  //                     color: ChatColor.almond,
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 for (var message in _userData['favouriteMessages'] ?? [])
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //                     child: Text(
  //                       message,
  //                       style: const TextStyle(
  //                         color: Colors.white70,
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                   ),
  //               ],
  //             ),
  //           ),
  //         )
  //       : const SizedBox.shrink();
  // }
}
