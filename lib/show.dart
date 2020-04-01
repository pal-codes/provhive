import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:provhive/models/user.dart';

//Screen to show the list of people
class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    String username = Hive.box<User>('userBox').get(User()).toString();
    final users = Hive.box<User>('userBox').get(User(), defaultValue: User(name: 'aayush', number: '767759485'));
    print(username);
    String ind = Hive.box<User>('userBox').getAt(0).toString();
    print("IND " + ind);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20),
        color: Colors.red,
        child: Row(
          children: <Widget>[
            // Text(users.name),
            // Text(users.number)
          ],
        ),
      ),
    );
  }
}
