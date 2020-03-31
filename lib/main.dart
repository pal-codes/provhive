import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provhive/show.dart';
import 'package:provhive/models/user.dart';


void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
  Hive.registerAdapter<User>(UserAdapter());
  await Hive.openBox<User>('userBox');
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  // Function to add the user data.
  addUser() {
    final Box<User> nowBox = Hive.box('userBox');
    User newUser =
        User(name: nameController.text, number: numberController.text);
    nowBox.add(newUser);
    print('NEW USER:' + newUser.name.toString());
    print('NEW NUMBER: ' + newUser.number.toString());
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
                  onPressed: addUser,
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ShowData()),
                    // );
                  },
                  child: Text('Check list'),
                ),
              )
            ],
          ),
        ));
  }
}
