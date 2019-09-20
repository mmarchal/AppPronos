import 'package:flutter/material.dart';
import 'package:team_ayf/models/custom_text.dart';
import 'package:team_ayf/models/imageProno.dart';
import 'package:team_ayf/models/pronosC.dart';

class PronoDetail extends StatefulWidget {
  PronoDetail({Key key, this.pronosC}) : super(key: key);

  @required final PronosC pronosC;

  @override
  State<StatefulWidget> createState() {
    return new _PronoDetail();
  }
}

class _PronoDetail extends State<PronoDetail> {
  @override
  Widget build(BuildContext context) {
    PronosC prono = widget.pronosC;
    return new Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: new AppBar(
        title: CustomText("Prono en détail", color: Colors.white, decoration: TextDecoration.none,),
        backgroundColor: Colors.orange[300],
        centerTitle: true,
      ),
      body: new Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              containerAndWidget(20, ImageProno().imageTop(prono.sport, MediaQuery.of(context).size.width/3)),
              containerAndWidget(10, CustomText("Date : ${prono.date_match.day.toString()}/${prono.date_match.month.toString()}/${prono.date_match.year.toString()}", family: 'Nature', factor: 1.5,)),
              containerAndWidget(10, CustomText(prono.match_prono, factor: 2.0, family: 'Nature',)),
              containerAndWidget(10, CustomText("Pronostic du bookmaker ${prono.bookmaker} : ", family: 'Nature', factor: 1.5,)),
              containerAndWidget(10, CustomText(prono.pronostic, family: 'Nature', factor: 2.0, color: Colors.red,)),
              containerAndWidget(10, CustomText("Côte : ${prono.cote}", family: 'Nature', factor: 1.5,)),
              containerAndWidget(10, CustomText(prono.explication, family: 'Nature', factor: 1.5,)),
            ],
          ),
        ),
      ),
    );
  }

  Widget containerAndWidget(double marge, Widget widget) {
    return Container(
      margin: EdgeInsets.all(marge),
      child: widget,
    );
  }

}