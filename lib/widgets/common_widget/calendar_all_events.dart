import 'package:flutter/material.dart';

class CalendarAllEvents extends StatefulWidget {
  const CalendarAllEvents({super.key});

  @override
  State<CalendarAllEvents> createState() => _CalendarAllEventsState();
}

class _CalendarAllEventsState extends State<CalendarAllEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('All Events'),
      ),
    );
  }
}
