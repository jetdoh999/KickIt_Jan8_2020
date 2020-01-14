import 'package:flutter_ui_designs/log/SignIn.dart';
import 'package:flutter_ui_designs/log/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_designs/log/HomePage.dart';
import 'package:flutter_ui_designs/notifier/auth_notifier.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ui_designs/notifier/food_notifier.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => AuthNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => FoodNotifier(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Loogin',
      theme: ThemeData(),
      home: HomePage(),
      routes: {
        '/home': (BuildContext context)=> HomePage(),
        '/signin': (BuildContext context)=> SignIn(),
        '/signup': (BuildContext context)=> SignUp(),
      },
    );
  }
}