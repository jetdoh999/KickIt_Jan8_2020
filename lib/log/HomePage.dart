import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui_designs/feedx.dart';

import 'package:flutter_ui_designs/one.dart';
import 'package:flutter_ui_designs/seven.dart';
import 'package:flutter_ui_designs/three.dart';
import 'package:flutter_ui_designs/two.dart';
import 'package:flutter_ui_designs/firebase1.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:morpheus/morpheus.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;
  bool isSignedIn = false;
  String imageUrl;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, '/signin');
      }
    });
  }

  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isSignedIn = true;
        this.imageUrl = user.photoUrl;
      });
    }
    print("${user.displayName} is the user ${user.photoUrl}");
  }

  signout() async {
    _auth.signOut();
  }

  @override
  void initState() {
    print("HomePage");
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  final List<Widget> _screens = [
    OneTab(),
    TwoTab(),
    SevenTab(),
    ThreeTab(),
    Feedx(),
    HomeScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("building Feed");
    return Scaffold(
      body: MorpheusTabView(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black.withOpacity(0.7),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 7,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.user,
            ),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.futbol_o,
            ),
            title: Text('MyTeam'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.group,
            ),
            title: Text('All Player'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.globe,
            ),
            title: Text('All Team'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.cloud,
            ),
            title: Text('Social'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.hand_o_right,
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
