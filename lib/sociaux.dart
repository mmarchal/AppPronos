import 'package:flutter/material.dart';
import 'package:team_ayf/models/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Sociaux extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Sociaux();
  }
}

class _Sociaux extends State<Sociaux> {

  List<Map> listeReseaux = [
    {'nom' : 'Facebook', 'photo' : 'assets/reseaux/facebook.png', 'couleur' : Colors.blue[600], 'url' : 'https://www.facebook.com/groups/294839581173219/'},
    {'nom' : 'Twitter', 'photo' : 'assets/reseaux/twitter.png', 'couleur' : Colors.blue[300]},
    {'nom' : 'Instagram', 'photo' : 'assets/reseaux/instagram.png', 'couleur' : Colors.yellow},
    {'nom' : 'Mail', 'photo' : 'assets/reseaux/email.png', 'couleur' : Colors.red },
  ];

  List<Widget> generateButtons() {

    List<Widget> liste = new List();
    listeReseaux.forEach((value){
      Widget test = new Container(
        margin: EdgeInsets.all(30),
        child: RaisedButton(
            onPressed: () {
              print(value['url']);
              _launchURL(value['url']);
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
        ),
      );
      liste.add(test);
    });
    return liste;
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: CustomText("Nos reseaux sociaux", color: Colors.white, decoration: TextDecoration.none,),
        centerTitle: true,
        backgroundColor: Colors.orange[200],
      ),
      backgroundColor: Colors.orange[200],
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: generateButtons(),
        )
      )
    );
  }
}
