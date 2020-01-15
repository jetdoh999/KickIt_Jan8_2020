import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/joinbar/joins.dart';
import 'package:flutter_ui_designs/joinbar/myappbar.dart';
import 'package:flutter_ui_designs/joinbar/myflexiableappbar.dart';
import 'package:flutter_ui_designs/scaffold/create_player.dart';

enum PageEnum {
  firstPage,
  secondPage,
}

class Join extends StatefulWidget {
  final String teamID;

  Join({Key key, @required this.teamID}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Join();
  }
}

class _Join extends State<Join> {
  Future<void> readAllDataUser() async {
    CollectionReference collectionReference =
        Firestore.instance.collection('Team');

    collectionReference
        .document(widget.teamID)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      print('document = ${documentSnapshot.data}');

      // if (valueDataUsers.length != 0) {
      //   valueDataUsers.removeWhere((item) => item != null);
      // }

      // int index = 0;
      // for (var string in keyData) {
      //   String value = documentSnapshot.data[string];
      //   setState(() {
      //     valueDataUsers.add(value);
      //   });
      //   print('valueDataUsers[$index] = ${valueDataUsers[index]}');
      //   index++;
      // }
    });
  }

  @override
  void initState() {
    readAllDataUser();
    super.initState();
  }

  _onSelect(PageEnum value) {
    switch (value) {
      case PageEnum.firstPage:
        print('First');
        routeToCreateTeam();
        break;
      case PageEnum.secondPage:
        print('Second');
        break;
    }
  }

  void routeToCreateTeam() {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext buildContext) {
      return CreatePlayer();
    });
    Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Join the Team",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          actions: <Widget>[
            SizedBox.fromSize(
                size: Size(50, 50),
                child: ClipOval(
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.person_add,
                                  size: 28,
                                  color: Colors.black,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "Invite",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ))))),
          ],
        ),
        body: Container(
            child: Column(children: <Widget>[
          Joins(),
        ])));
  }
}
