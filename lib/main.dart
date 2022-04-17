import 'package:flutter/material.dart';
import 'package:kadamcounter/dahboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: dashboard(),
      debugShowCheckedModeBanner: false,
      title: "Kadam Counter",
    );
  }
}
