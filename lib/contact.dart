import 'package:flutter/material.dart';
import 'package:team_ayf/models/custom_text.dart';

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
      appBar: new AppBar(
        title: CustomText("Contact", color: Colors.white, decoration: TextDecoration.none,),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      backgroundColor: Colors.green[200],
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Icon(
              Icons.account_circle,
              size: MediaQuery.of(context).size.width/4,
              color: Colors.green,
            ),
            new Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.only(bottom: 20.0),
                  width: MediaQuery.of(context).size.width/2.2,
                  child: new Column(
                    children: <Widget>[
                      new Text("Nom", textScaleFactor: 1.5, textAlign: TextAlign.center, style: TextStyle(color: Colors.green)),
                      new TextField(

                      ),
                    ],
                  ),
                ),
                new Container(color: Colors.grey, height: 80, width: 2,),
                new Container(
                  width: MediaQuery.of(context).size.width/2.2,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: new Column(
                    children: <Widget>[
                      new Text("Adresse mail", textScaleFactor: 1.5, textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
                      new TextField(

                      ),
                    ],
                  ),
                )
              ],
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: new Text("Message", textScaleFactor: 1.5, style: TextStyle(color: Colors.green),),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.only(bottom: 40.0),
                    child: TextField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Comment!",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            new RaisedButton(
              onPressed: () {
                print("Appuyé");
              },
              child: new Text("Envoyer", style: TextStyle(color: Colors.green),),
            )
          ],
        )
      ),
    );
  }

}