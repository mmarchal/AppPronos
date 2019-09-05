import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Map> mapsButtons = [
    {'nom' : 'Pronostics', 'couleur' : Colors.blue, 'image' : 'assets/foot.jpg'},
    {'nom' : 'Historique', 'couleur' : Colors.red, 'image' : 'assets/tennis.jpg'},
    {'nom' : 'Contact', 'couleur' : Colors.green, 'image' : 'assets/basket.png'},
    {'nom' : 'Réseaux sociaux', 'couleur' : Colors.orange, 'image' : 'assets/reseaux.png'},
  ];

  Widget appBarHP() {
    return new PreferredSize(
      child: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(widget.title),
        centerTitle: true,
      ),
      preferredSize: Size.fromHeight(50.0),
    );
  }

  Widget bodyHP() {
    return new Column(
      children: <Widget>[
        Image.asset("assets/top.png", width: MediaQuery.of(context).size.width,),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            widget.title,
            textScaleFactor: 2.0,
            style: TextStyle(
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
                      child: Image.asset(
                        value['image'],
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    onTap: () {
                      print(value);
                    },
                  );
                }
            )
        )
      ],
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