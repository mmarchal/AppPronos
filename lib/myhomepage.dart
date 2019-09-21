import 'package:flutter/material.dart';
import 'package:team_ayf/classement.dart';
import 'package:team_ayf/contact.dart';
import 'package:team_ayf/pronostic.dart';
import 'package:team_ayf/sociaux.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Map> mapsButtons = [
    {'nom' : 'Pronostics', 'couleur' : Colors.blue, 'image' : 'assets/foot.jpg'},
    {'nom' : 'Classement', 'couleur' : Colors.red, 'image' : 'assets/tennis.jpg'},
    {'nom' : 'Contact', 'couleur' : Colors.green, 'image' : 'assets/basket.png'},
    {'nom' : 'Reseaux sociaux', 'couleur' : Colors.orange, 'image' : 'assets/reseaux.png'},
  ];

  Widget appBarHP() {
    return new PreferredSize(
      child: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      preferredSize: Size.fromHeight(30.0),
    );
  }

  Widget bodyHP() {
    return new Container(
      color: Colors.black,
      child: new Column(
        children: <Widget>[
          Image.asset("assets/top.png", width: MediaQuery.of(context).size.width,),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              widget.title,
              textScaleFactor: 2.0,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontFamily: 'Avengers'
              ),
            ),
          ),
          Flexible(
              child: GridView.builder(
                  itemCount: mapsButtons.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    Map value = mapsButtons[index];
                    return new InkWell(
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset(
                              value['image'],
                              fit: BoxFit.fill,
                            ),
                            Text(
                              value['nom'],
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  color: value['couleur'],
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Avengers'
                              ),
                            )
                          ],
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC){
                          switch (index) {
                            case 0 :
                              return new Pronostic();
                              break;
                            case 1 :
                              return new Classement();
                              break;
                            case 2 :
                              return new Contact();
                              break;
                            case 3 :
                              return new Sociaux();
                              break;
                            default:
                              return new MyHomePage();
                              break;
                          }
                        }));
                      },
                    );
                  }
              )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHP(),
      body: bodyHP(),
    );
  }
}