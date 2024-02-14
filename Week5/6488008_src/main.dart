import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'homePage.dart';
import 'calendarPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calendar App',
    theme: ThemeData(primarySwatch: Colors.blue),
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      // '/mood': (context) => MoodPage(),
      '/calendar': (context) => CalendarPage(),
      // '/home': (context) => HomePage(),
      // '/task': (context) => TaskPage(),
      // '/setting': (context) => SettingPage(),
    },
  ));
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalendarPage(),
    );
  }
}
