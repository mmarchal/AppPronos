import 'package:flutter/material.dart';

class Sociaux extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Sociaux();
  }
}

class _Sociaux extends State<Sociaux> {

  List<Map> listeReseaux = [
    {'nom' : 'Facebook', 'photo' : 'assets/reseaux/facebook.png', 'couleur' : Colors.blue[600]},
    {'nom' : 'Twitter', 'photo' : 'assets/reseaux/twitter.png', 'couleur' : Colors.red},
    {'nom' : 'Instagram', 'photo' : 'assets/reseaux/instagram.png', 'couleur' : Colors.green},
    {'nom' : 'Mail', 'photo' : 'assets/reseaux/mail.jpg', 'couleur' : Colors.orange },
  ];

  List<Widget> generateButtons() {

    List liste = new List();
    listeReseaux.forEach((value){
      Widget test = new RaisedButton(
          onPressed: () {
            print('${value['nom']} cliqué');
          },
          color: value['couleur'],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)),
          child: new Container(
            width: MediaQuery.of(context).size.width/2,
            padding: EdgeInsets.all(5.0),
            child: new Row(
              children: <Widget>[
                new Image.asset(value['photo'], width: 50, height: 50,),
                new Padding(padding: EdgeInsets.only(left: 20.0)),
                new Text(value['nom'], textAlign: TextAlign.center, textScaleFactor: 1.5, style: TextStyle(color: Colors.white),)
              ],
            )
          )
      );
      liste.add(test);
    });
    return liste;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: generateButtons(),
        )
      )
    );
  }
}
