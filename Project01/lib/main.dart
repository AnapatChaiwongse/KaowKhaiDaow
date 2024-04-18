import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homePage.dart';
import 'calendarPage.dart';
import 'settingPage.dart';
import 'loginPage.dart';
import 'taskPage.dart';
import 'moodPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => loginPage(),
        '/mood': (context) => MoodPage(),
        '/calendar': (context) => CalendarPage(),
        '/task': (context) => TaskPage(),
        '/setting': (context) => SettingPage(),
      },
    ),
  );
}
