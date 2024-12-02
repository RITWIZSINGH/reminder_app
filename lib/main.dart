import 'package:flutter/material.dart';
import 'screens/reminder_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NexaRegular',
      ),
      home: ReminderScreen(),
    );
  }
}