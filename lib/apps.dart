
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/stats/my_stats.dart';
import 'one.dart';
import 'two.dart';
import 'three.dart';
import 'fourrr.dart';
import 'five.dart';
import 'six.dart';




class KickItApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KickItHomePages(),
    );
  }
}


class KickItHomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.person_pin, size: 26),
            title: const Text("Player"),
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 26),
            title: Text('Team'),
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.public, size: 26),
            title: Text('All Team'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.assessment, size: 26),
            title: Text('Stats'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 26),
            title: Text('Stadium'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 26),
            title: Text('Market'),
          ),

        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: OneTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: TwoTab(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ThreeTab(),
              );
            });
            break;
          case 3:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: MyStats(),
              );
            });
            break;
          case 4:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: FiveTab(),
              );
            });
            break;
          case 5:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: FourTabss(),
              );
            });
            break;

        }
        return returnValue;
      },
    );
  }
}