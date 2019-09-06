import 'package:flutter/material.dart';

class Classement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Classement();
  }
}

class _Classement extends State<Classement> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("Classement"),
      ),
    );
  }

}