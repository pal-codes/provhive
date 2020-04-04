import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provhive/models/user.dart';

//Screen to show the list of people
class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  Box box = Hive.box<User>('userBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.all(20),
          color: Colors.red,
          child: ValueListenableBuilder(
            child: Container(
              color: Colors.yellow,
            ),
            valueListenable: box.listenable(),
            builder: (BuildContext context, Box box, _) {
              if (box.values.isEmpty) {
                return Container(
                  child: Row(
                    children: <Widget>[Text('USER')],
                  ),
                );
              } else {
                return Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(50),
                  child: Text('HEY! ' + box.values.last.name),
                );
              }
            },
          )),
    );
  }
}
