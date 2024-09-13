import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String selectedMoto = 'motogp'; // Giá trị chọn của tab 1
  String selectedRacWup = 'RAC'; // Giá trị chọn của tab 2

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _navigateToScreen(String moto, String racWup) {
    // Điều hướng đến màn hình khác dựa vào sự lựa chọn
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(moto: moto, racWup: racWup),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Chọn MotoGP, Moto2, Moto3, MotoE
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: selectedMoto,
                  items:
                      ['motogp', 'moto2', 'moto3', 'motoe'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMoto = newValue!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _navigateToScreen(selectedMoto, selectedRacWup);
                  },
                  child: Text('Go to Screen'),
                ),
              ],
            ),
          ),
          // Tab 2: Chọn RAC, WUP
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: selectedRacWup,
                  items: ['RAC', 'WUP'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRacWup = newValue!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _navigateToScreen(selectedMoto, selectedRacWup);
                  },
                  child: Text('Go to Screen'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String moto;
  final String racWup;

  ResultScreen({required this.moto, required this.racWup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Center(
        child: Text('You selected: $moto and $racWup'),
      ),
    );
  }
}
