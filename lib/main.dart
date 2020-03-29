import 'package:flutter/material.dart';
import 'package:meetup_covid_mt/app/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Tracker MT',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Dashboard(),
    );
  }
  
}