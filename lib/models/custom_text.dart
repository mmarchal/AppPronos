import 'package:flutter/material.dart';

class CustomText extends Text {

  CustomText(String data, {color: Colors.white, textAlign: TextAlign.center, factor: 1.0, decoration : TextDecoration.none, family : 'Nature'}):
        super(
        data,
        textScaleFactor: factor,
        style: TextStyle(
          decoration: decoration,
          color: color,
          fontFamily: family
        ),
      );

}