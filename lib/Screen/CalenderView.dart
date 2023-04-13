import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendarWidget extends StatefulWidget {
  const MyCalendarWidget({Key? key}) : super(key: key);
  @override
  _MyCalendarWidgetState createState() => _MyCalendarWidgetState();
}

class _MyCalendarWidgetState extends State<MyCalendarWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calender View"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2010),
          lastDay: DateTime.utc(2040)),
    );
  }
}
