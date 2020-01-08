import 'package:flutter/material.dart';

import 'package:flutter_ui_designs/animed/animated_bottom_bar.dart';
import 'package:flutter_ui_designs/one.dart';
import 'package:flutter_ui_designs/two.dart';
import 'package:flutter_ui_designs/three.dart';
import 'package:flutter_ui_designs/four.dart';
import 'package:flutter_ui_designs/five.dart';



class BottomBarNavigationPatternExample extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Profile",
      iconData: Icons.person_pin,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Team",
      iconData: Icons.supervised_user_circle,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "All",
      iconData: Icons.public,
      color: Colors.yellow.shade900,
    ),
    BarItem(
      text: "Stats",
      iconData: Icons.assessment,
      color: Colors.blueAccent,
    ),
    BarItem(
      text: "Field",
      iconData: Icons.map,
      color: Colors.greenAccent,
    ),
  ];

  @override
  _BottomBarNavigationPatternExampleState createState() =>
      _BottomBarNavigationPatternExampleState();
}

class _BottomBarNavigationPatternExampleState
    extends State<BottomBarNavigationPatternExample> {
  int selectedBarIndex = 0;

  List<Widget> _pages = [
    OneTab(),
    TwoTab(),
    ThreeTab(),
    FourTab(),
    FiveTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: _pages [selectedBarIndex],
    


      bottomNavigationBar: AnimatedBottomBar(
          barItems: widget.barItems,
          animationDuration: const Duration(milliseconds: 150),
          barStyle: BarStyle(fontSize: 12.0, iconSize: 26.0),
          
          onBarTap: (index) {
            setState(() {
              selectedBarIndex = index;
            });
          }
        
    ));
  }
}
