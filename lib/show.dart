import 'package:flutter/material.dart';

//Screen to show the list of people 
class ShowData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Text('one'),
            Text('two')
          ],
        ),
      ),
    );
  }
}
