import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:team_ayf/models/api.dart';
import 'package:team_ayf/models/custom_text.dart';
import 'package:team_ayf/models/imageProno.dart';
import 'package:team_ayf/models/pronosC.dart';
import 'package:team_ayf/pronoDetail.dart';

class Pronostic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Pronostic();
  }
}

class _Pronostic extends State<Pronostic> {

  List<PronosC> pronostics = new List();
  bool isVisible = false;

  Widget pronoAppBar() {
    return new AppBar(
      title: CustomText("Pronostic", color: Colors.white, decoration: TextDecoration.none, factor: 2.0,),
      backgroundColor: Colors.blue[200],
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                isVisible = false;
              });
              _getDatas();
            }
        ),
      ],
      centerTitle: true,
    );
  }


  @override
  void initState() {
    super.initState();
    _getDatas();
  }

  _getDatas() {
    Api.getPronos().then((response){
        Iterable list = json.decode(response.body);
        pronostics = list.map((data) => PronosC.fromJson(data)).toList();
        setState(() {
          isVisible = true;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: pronoAppBar(),
      backgroundColor: Colors.blue[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Visibility(
            visible: !isVisible,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Visibility(
            visible: isVisible,
              child: new Flexible(
                  child: ListView.builder(
                    //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: pronostics.length,
                    itemBuilder: (context, index) {
                      PronosC pronos = pronostics[index];
                      return InkWell(
                        child: new Container(
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.all(Radius.circular(20)),
                            color: resultatProno(pronos.resultat),
                          ),
                          margin: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          child: new Row(
                            children: <Widget>[
                              ImageProno().imageTop(pronos.sport, MediaQuery.of(context).size.width/8),
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Container(height: 4.0),
                                  new CustomText("Prono proposé par : ${pronos.bookmaker}", factor: 1.7,),
                                  new Container(height: 10.0),
                                  new CustomText("Match : ${pronos.match_prono}", factor: 1.5,),
                                  new Container(
                                      margin: new EdgeInsets.symmetric(vertical: 8.0),
                                      height: 2.0,
                                      width: 18.0,
                                      color: new Color(0xff00c6ff)
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new Image.asset("assets/avis.png", height: 20.0),
                                      new Container(width: 8.0),
                                      new CustomText(pronos.pronostic, factor: 1.3,),
                                      new Container(width: 24.0),
                                      new Image.asset("assets/pourcentage.png", height: 20.0),
                                      new Container(width: 8.0),
                                      new CustomText(pronos.cote.toString(), factor: 1.3,),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext Bc){
                            return new PronoDetail(pronosC: pronos,);
                          }));
                        },
                      );
                    },
                  )
              )
          )
        ],
      ),
    );
  }

  resultatProno(int resultat) {
    switch (resultat) {
      case 0 :
        return Colors.red;
        break;
      case 1 :
        return Colors.green;
        break;
      default :
        return Colors.black;
        break;
    }
  }
}