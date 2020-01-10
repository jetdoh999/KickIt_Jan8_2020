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
  final int currentIndex;
  final String teamName;
  final String teamLevel;
  final String teamAddr;
  HomePage(
      {Key key,
      this.currentIndex,
      this.teamName,
      this.teamAddr,
      this.teamLevel})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;
  bool isSignedIn = false;
  String imageUrl;
  int _currentIndex;

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
    widget.currentIndex == null
        ? _currentIndex = 0
        : _currentIndex = widget.currentIndex;
 
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      OneTab(),
      TwoTab(
          name: widget.teamName,
          address: widget.teamAddr,
          level: widget.teamLevel),
      SevenTab(),
      ThreeTab(),
      Feedx(),
      HomeScreen(),
    ];

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
            }));
  }
}
