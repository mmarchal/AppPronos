import 'package:flutter/material.dart';

class ImageProno {

  Widget imageTop(String sport, double d) {
    String image;
    switch (sport) {
      case "Football" :
        image = "assets/ballon_foot.png";
        break;
      case "Tennis" :
        image = "assets/balle_tennis.png";
        break;
      default :
        image = "assets/question.jpg";
        break;
    }
    return Container(margin: EdgeInsets.all(10.0),child: Image.asset(image, width: d,),);
  }

}