import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_ui_designs/review.dart';
import 'package:flutter_ui_designs/firebase1.dart';
import 'package:flutter_ui_designs/three.dart';
import 'package:morpheus/morpheus.dart';
import 'package:flutter/material.dart';
import 'one.dart';
import 'two.dart';

class CustomAppBarDemo extends StatefulWidget {
  final int currentIndex;
  CustomAppBarDemo({Key key, this.currentIndex}) : super(key: key);

  @override
  _CustomAppBarDemoState createState() => _CustomAppBarDemoState();
}

class _CustomAppBarDemoState extends State<CustomAppBarDemo> {
  List<TabItem> items = <TabItem>[
    TabItem(icon: Icons.person_pin, title: 'Profile'),
    TabItem(icon: Icons.supervised_user_circle, title: 'MyTeam'),
    TabItem(icon: Icons.public, title: 'Social'),
    TabItem(icon: Icons.new_releases, title: 'News'),
  ];

  final List<Widget> _screens = [
    OneTab(),
    TwoTab(),
    FirestoreSlideshow(),
    HomeScreen(),
  ];
  int _currentIndex;

  @override
  void initState() { 
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MorpheusTabView(child: _screens[_currentIndex]),
        
        bottomNavigationBar: ConvexAppBar.builder(
            count: items.length,
            onTap: (index) {
              if (index != _currentIndex) {
                setState(() => _currentIndex = index);
              }
            },
            tabBuilder: (BuildContext context, int index, bool active) {
              var navigationItem = items[index];

              var _color = active ? Colors.blue : Colors.black45;

              var _icon = active
                  ? navigationItem.activeIcon ?? navigationItem.icon
                  : navigationItem.icon;

              return Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      _icon,
                      color: _color,
                      size: 31,
                    ),
                    Text(
                      navigationItem.title,
                      style: TextStyle(color: _color, fontSize: 8),
                    )
                  ],
                ),
              );
            },
            actionBuilder: (BuildContext context, int index, bool active) {
              var _color = active ? Colors.green : Colors.black12;

              return Stack(alignment: Alignment.center, children: <Widget>[
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                        height: 52,
                        width: 52,
                        child: RaisedButton(
                            child: Image.asset('assets/atro/Football.png'),
                            elevation: 5.0,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.all(4),
                            color: Colors.white38,
                            splashColor: Colors.blue.withOpacity(0.2),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ThreeTab()));
                            })))
              ]);
            })
            );
  }
}
