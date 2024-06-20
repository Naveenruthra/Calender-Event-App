import 'package:calender_event_app/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalenderEventApp());
}

class CalenderEventApp extends StatelessWidget {
  const CalenderEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
