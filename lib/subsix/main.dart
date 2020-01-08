import 'package:flutter/material.dart';

import 'package:flutter_ui_designs/appss.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomAppBarDemo(),
    );
  }
}
