import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'myapp.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}