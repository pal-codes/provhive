import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provhive/models/user.dart';



//Screen to show the list of people 
class ShowData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Hive.openBox('userBox');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
          itemBuilder: Hive.box('userBox').get(User()),
          itemCount: Hive.box('userBox').length,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
