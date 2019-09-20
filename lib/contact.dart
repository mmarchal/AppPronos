import 'package:flutter/material.dart';
import 'package:team_ayf/models/api.dart';
import 'package:team_ayf/models/custom_text.dart';
import 'package:team_ayf/models/mail.dart';
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
                  Mail message = new Mail(nomC, emailC, messageC);
                  Api.sendMail(message).then((response){
                    if(response.body == "true") {
                      Toast.show("Message envoyé", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM, backgroundColor: Colors.green);
                    } else {
                      Toast.show("Erreur :  ${response.statusCode}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM, backgroundColor: Colors.red);
                    }
                  });
                },
                child: new Text("Envoyer", style: TextStyle(color: Colors.green),),
              )
            ],
          ),
        )
      ),
    );
  }
}