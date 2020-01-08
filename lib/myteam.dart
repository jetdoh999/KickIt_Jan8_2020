import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/myteambar/teamapi.dart';
import 'package:flutter_ui_designs/myteambar/teams.dart';
import 'package:flutter_ui_designs/myteambar/myappbar.dart';
import 'package:flutter_ui_designs/myteambar/myflexiableappbar.dart';
import 'package:flutter_ui_designs/one.dart';


class MyTeam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTeam();
  }
}

class _MyTeam extends State<MyTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        title: MyAppBar(),
        pinned: true,
        expandedHeight: 210.0,
        backgroundColor: Colors.black87.withBlue(7),
        flexibleSpace: FlexibleSpaceBar(
          background: MyFlexiableAppBar(),
        ),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        Column(children: <Widget>[
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
        ])
      ]))
    ]));
  }
}

Widget _buildCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    elevation: 5.0,
    child:  InkWell(
    onTap: () {
      print("tapped");
    },
    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      const ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage("assets/Ton.jpg"),
        ),
        title: Text('Ekachai Ton'),
        subtitle: Text('Midfielder, Right Foot, No.10'), 
        trailing: Text('Age 39'),
        
      ),
     
    ]),
  ));
}
