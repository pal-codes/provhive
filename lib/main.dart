import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provhive/show.dart';
import 'package:provhive/models/user.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
  Hive.openBox<User>('userBox');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  final TextEditingController userController = TextEditingController();

  addUser() { 
    Hive.box('userBox').add('controller.value');
  }

  @override
  Widget build(BuildContext context) {
    Hive.isBoxOpen('userBox');
    print('HIVE IS: ' + Hive.isBoxOpen('userBox').toString());
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 320),
                child: TextField(
                  maxLines: 1,
                  controller: userController,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Enter your name',
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Enter your phone number',
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShowData()),
                    );
                  },
                  child: Text('Check list'),
                ),
              )
            ],
          ),
        ));
  }
}