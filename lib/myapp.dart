import 'package:flutter/material.dart';

import 'myhomepage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team AYF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Team Alex, Yann & Fab'),
    );
  }
}