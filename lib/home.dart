import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provhive/show.dart';
import 'package:provhive/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  // Function to add the user data.
  addUser() {
    // var box =  Hive.box<User>('userBox');
    // User newUser =
    //     User(name: nameController.text, number: numberController.text);
    var newUser =
        User(name: nameController.text, number: numberController.text);
    Hive.box<User>('userBox').add(newUser);
    // Hive.box<User>('userBox').listenable();
  }

  // Function to print user data.
  showUser() {
    var theUser = Hive.box<User>('userBox').getAt(1);
    print("THE USER: " + theUser.name.toString());
  }

  @override
  Widget build(BuildContext context) {
    Hive.isBoxOpen('userBox');
    print('HIVE IS OPEN: ' + Hive.isBoxOpen('userBox').toString());
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
                  controller: nameController,
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
                  controller: numberController,
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
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    addUser();
                  },
                  child: Text('Submit'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: FlatButton(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
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
                    showUser();
                  },
                  child: Text('Check list'),
                ),
              )
            ],
          ),
        ));
  }
}
