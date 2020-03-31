import 'package:flutter/material.dart';

class ShowData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text('one'),
            Text('two')
          ],
        ),
      ),
    );
  }
}
