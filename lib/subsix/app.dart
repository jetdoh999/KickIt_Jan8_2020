import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:morpheus/morpheus.dart';
import 'package:flutter_ui_designs/one.dart';
import 'package:flutter_ui_designs/two.dart';
import 'package:flutter_ui_designs/three.dart';
import 'package:flutter_ui_designs/four.dart';
import 'package:flutter_ui_designs/five.dart';
import 'package:flutter_ui_designs/hero/main.dart';

class MyTabScreen extends StatefulWidget {
  @override
  _MyTabScreenState createState() => _MyTabScreenState();
}

class _MyTabScreenState extends State<MyTabScreen> {
  final List<Widget> _screens = [
    OneTab(),
    TwoTab(),
    ThreeTab(),
    FourTab(),
    FiveTab(),
    MyApp(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  

      body: MorpheusTabView(child: _screens[_currentIndex]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black.withOpacity(0.7),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 9,
        iconSize: 30,

        
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
            ),
            title: Text('Player'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
            ),
            title: Text('MyTeam'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.public,
            ),
            title: Text('AllTeam'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.trending_up,
            ),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            title: Text('Fields'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.new_releases,
            ),
            title: Text('News'),
          ),
        ],
        onTap: (index) {
          if (index != _currentIndex) {
            setState(() => _currentIndex = index);
          }
        },
      ),
    );
  }
}




