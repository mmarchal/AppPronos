import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Contact();
  }
}

class _Contact extends State<Contact> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("Pronostic"),
      ),
    );
  }

}