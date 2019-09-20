import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:team_ayf/models/api.dart';
import 'package:team_ayf/models/custom_text.dart';
import 'package:team_ayf/models/ranking.dart';

class Classement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Classement();
  }
}

class _Classement extends State<Classement> {

  int _currValue = 1;
  List<String> pays = ['France', 'Espagne', 'Italie', 'Allemagne', 'Angleterre'];
  List<Map> sendUrl = [
    {'pays': 'france', 'nom' : 'ligue-1'},
    {'pays': 'espagne', 'nom' : 'primera-division'},
    {'pays': 'italie', 'nom' : 'serie-a'},
    {'pays': 'allemagne', 'nom' : 'bundesliga-1'},
    {'pays': 'angleterre', 'nom' : 'barclays-premiership-premier-league'},
  ];

  var isVisibleList = false;
  var isVisibleProgress = false;
  var ranks = new List<Ranking>();

  Widget textAndRadio(int id) {
    return new Row(
      children: <Widget>[
        CustomText(pays[id]),
        new Radio(
          activeColor: Colors.red[800],
          groupValue: _currValue,
          onChanged: (int i) => setState(() => _currValue = i),
          value: id,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: CustomText("Classement", color: Colors.white, decoration: TextDecoration.none,),
        backgroundColor: Colors.deepPurpleAccent[200],
        centerTitle: true,
      ),
      backgroundColor: Colors.deepPurpleAccent[200],
      body: new Center(
        child: new Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                textAndRadio(0),
                textAndRadio(1),
                textAndRadio(2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                textAndRadio(3),
                textAndRadio(4),
              ],
            ),
            RaisedButton(
              color: Colors.black,
              child: CustomText("Envoyer"),
              onPressed: () {
                setState(() {
                  isVisibleProgress= true;
                });
                Map result = sendUrl[_currValue];
                Api.getRanking(result['pays'], result['nom']).then((response){
                  if(response.statusCode == 200) {
                    Iterable list = json.decode(response.body);
                    ranks = list.map((model) => Ranking.fromJson(model)).toList();
                    setState(() {
                      isVisibleList = true;
                      isVisibleProgress= false;
                    });
                  }
                });
              }
            ),
            Visibility(
                visible: isVisibleProgress,
                child: CircularProgressIndicator(backgroundColor: Colors.red,)
            ),
            Visibility(
              visible: isVisibleList,
              child: Flexible(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(height: 2.0, color: Colors.black),
                  itemCount: ranks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${ranks[index].place} : ${ranks[index].equipe} avec ${ranks[index].points} pts.")
                    );
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }

}