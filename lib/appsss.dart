import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:morpheus/morpheus.dart';
import 'one.dart';
import 'two.dart';
import 'three.dart';
import 'fourrr.dart';
import 'five.dart';
import 'package:flutter_ui_designs/hero/main.dart';

class MyTabScreen extends StatefulWidget {
  @override
  _MyTabScreenState createState() => _MyTabScreenState();
}

class _MyTabScreenState extends State<MyTabScreen> {
  final List<Widget> _screens = [
    OneTab(),
    TwoTab(),
    FourTabss(),
    ThreeTab(),
    FiveTab(),
    
  ];
  int _currentIndex = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MorpheusTabView(child: _screens[_currentIndex]),

      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: _currentIndex,

        items: [
          FFNavigationBarItem(
            iconData: Icons.person_pin,
            label: 'Player',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.supervised_user_circle,
            label: 'MyTeam',
            selectedBackgroundColor: Colors.green,
          ),
          FFNavigationBarItem(
            iconData: Icons.trending_up,
            label: 'Stats',
            selectedBackgroundColor: Colors.red,
          ),
          FFNavigationBarItem(
            iconData: Icons.public,
            label: 'AllTeam',
            selectedBackgroundColor: Colors.orange,
          ),
          FFNavigationBarItem(
            iconData: Icons.new_releases,
            label: 'News',
            selectedBackgroundColor: Colors.pink,
          ),
          
        ],
        onSelectTab: (index) {
          
            setState(() => _currentIndex = index);
          }
          )
        
      );

  }
}
