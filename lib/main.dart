import 'package:flutter/material.dart';
import 'package:provhive/home.dart';
import 'package:provhive/helper.dart';

void main() async {
  await configureHive();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: HomePage(),
    );
  }
}
