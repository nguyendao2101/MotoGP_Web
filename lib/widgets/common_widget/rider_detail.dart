import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RiderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> rider;

  RiderDetailScreen({required this.rider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rider['Name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rider['ImageRacer'] != ''
                ? Image.network(rider['ImageRacer'])
                : Icon(Icons.person, size: 100),
            SizedBox(height: 16),
            Text('Country: ${rider['Country']}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Id: ${rider['Id']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Team: ${rider['Team']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
