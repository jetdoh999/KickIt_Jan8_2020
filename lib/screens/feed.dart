import 'package:flutter_ui_designs/api/food_api.dart';
import 'package:flutter_ui_designs/notifier/auth_notifier.dart';
import 'package:flutter_ui_designs/notifier/food_notifier.dart';
import 'package:flutter_ui_designs/screens/details.dart';
import 'package:flutter_ui_designs/one.dart';
import 'package:flutter_ui_designs/teampage/pages/team_member_pages.dart';
import 'package:flutter_ui_designs/three.dart';
import 'package:flutter_ui_designs/two.dart';
import 'package:flutter_ui_designs/feedx.dart';
import 'package:flutter_ui_designs/firebase1.dart';
import 'package:flutter_ui_designs/five.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:morpheus/morpheus.dart';


class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
   
    super.initState();
  }

  final List<Widget> _screens = [
    OneTab(),
    TwoTab(),
    Feedx(),
    FiveTab(),
    HomeScreen(),
    
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
   
    

    print("building Feed");
    return Scaffold(
      body: MorpheusTabView(child: _screens[_currentIndex]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black.withOpacity(0.7),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 7,
        iconSize: 20,

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
            title: Text('Global'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            title: Text('Social'),
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
