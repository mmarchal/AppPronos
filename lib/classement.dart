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

  var isVisible = false;
  var ranks = new List<Ranking>();

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
                CustomText("France"),
                new Radio(
                  activeColor: Colors.red[800],
                  groupValue: _currValue,
                  onChanged: (int i) => setState(() => _currValue = i),
                  value: 0,
                ),
                CustomText("Espagne"),
                new Radio(
                  activeColor: Colors.red[800],
                  groupValue: _currValue,
                  onChanged: (int i) => setState(() => _currValue = i),
                  value: 1,
                ),
                CustomText("Italie"),
                new Radio(
                  activeColor: Colors.red[800],
                  groupValue: _currValue,
                  onChanged: (int i) => setState(() => _currValue = i),
                  value: 2,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomText("Allemagne"),
                new Radio(
                  activeColor: Colors.red[800],
                  groupValue: _currValue,
                  onChanged: (int i) => setState(() => _currValue = i),
                  value: 3,
                ),
                CustomText("Angleterre"),
                new Radio(
                  activeColor: Colors.red[800],
                  groupValue: _currValue,
                  onChanged: (int i) => setState(() => _currValue = i),
                  value: 4,
                ),
              ],
            ),
            RaisedButton(
              color: Colors.black,
              child: CustomText("Envoyer"),
              onPressed: () {
                Map result = sendUrl[_currValue];
                Api.getRanking(result['pays'], result['nom']).then((response){
                  Iterable list = json.decode(response.body);
                  ranks = list.map((model) => Ranking.fromJson(model)).toList();
                  setState(() {
                    isVisible = true;
                  });
                });
              }
            ),
            Visibility(
              visible: isVisible,
              child: Flexible(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(height: 2.0, color: Colors.black),
                  itemCount: ranks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),
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