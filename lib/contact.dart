import 'package:flutter/material.dart';
import 'package:team_ayf/models/api.dart';
import 'package:team_ayf/models/custom_text.dart';
import 'package:team_ayf/models/mail.dart';
import 'package:team_ayf/myhomepage.dart';
import 'package:toast/toast.dart';

class Contact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Contact();
  }
}

class _Contact extends State<Contact> {

  String nomC;
  String emailC;
  String messageC;
  String messageEndLoading = "Envoie en cours";
  bool visibleSendMessage = false;

  Widget appBarContact() {
    return new AppBar(
      title: CustomText("Contact", color: Colors.white, decoration: TextDecoration.none,),
      backgroundColor: Colors.green[200],
      centerTitle: true,
    );
  }

  Widget messageContact() {
    return new Container(
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
              onChanged: (String str) {
                setState(() {
                  messageC = str;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget nameAndMailContact() {
    return new Row(
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
                onChanged: (String str) {
                  setState(() {
                    nomC = str;
                  });
                },
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
                onChanged: (String str) {
                  setState(() {
                    emailC = str;
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  void _showDialog(bool b, Color color, String message) {
    if(color != Colors.black) {
      Navigator.of(context).pop();
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new CustomText("Message", color: color, factor: 2.0,),
          content: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                child: CircularProgressIndicator(),
                visible: b,
              ),
              Padding(padding: EdgeInsets.only(right: 30.0)),
              CustomText(message, color: color, factor: 1.5,)
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Visibility(
                visible: !b,
                child: new FlatButton(
                  child: new Text("Revenir au menu", style: new TextStyle(color: color),),
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC){
                      return new MyHomePage(title: 'Team Alex, Yann & Fab',);
                    }));
                  },
                ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarContact(),
      backgroundColor: Colors.green[200],
      body: new Center(
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(
                Icons.account_circle,
                size: MediaQuery.of(context).size.width/4,
                color: Colors.green,
              ),
              nameAndMailContact(),
              messageContact(),
              new RaisedButton(
                onPressed: () {
                  _showDialog(true, Colors.black, "Message en cours d'envoi !");
                  Mail message = new Mail(nomC, emailC, messageC);
                  Api.sendMail(message).then((response){
                    if(response.body == "true") {
                      _showDialog(false, Colors.green, "Message envoyé !");
                    } else {
                      _showDialog(false, Colors.red, "Erreur : " + response.body);
                    }
                  });
                },
                child: new Text("Envoyer", style: TextStyle(color: Colors.green),),
              ),
            ],
          ),
        )
      ),
    );
  }
}