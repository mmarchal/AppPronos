import 'package:flutter/material.dart';

class Pronostic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Pronostic();
  }
}

class _Pronostic extends State<Pronostic> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("Pronostic"),
      ),
    );
  }

}