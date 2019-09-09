import 'package:flutter/material.dart';
import 'package:team_ayf/models/custom_text.dart';

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
      appBar: new AppBar(
        title: CustomText("Pronostic", color: Colors.white, decoration: TextDecoration.none,),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[200],
      body: new Center(
        child: new Text("Pronostic"),
      ),
    );
  }

}