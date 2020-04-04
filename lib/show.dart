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
  static Box box = Hive.box<User>('userBox');
  final List<User> userList = box.values;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.all(20),
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
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, userlist) {
                      return Container(
                        child:
                            Text('HELO - ' + userList.map((e) => e).toString()),
                      );
                    },
                  ),
                );
              }
            },
          )),
    );
  }
}
