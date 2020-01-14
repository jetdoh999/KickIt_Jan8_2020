import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/log/HomePage.dart';

class ThreeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThreeTab();
  }
}

class _ThreeTab extends State<ThreeTab> {
  List<String> addresss = List();
  List<String> levels = List();
  List<String> nameTeams = List();
  // Field

  String uidLogin;

  List<String> urlTeams = List();

  // Method
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    findUid();
  }

  Future<void> findUid() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    uidLogin = firebaseUser.uid;

    await readAllTeam();

    // readTeam();
  }

  Future<void> readAllTeam() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Team');

    await collectionReference.snapshots().listen((QuerySnapshot querySnapshot) {
      for (var object in querySnapshot.documents) {
        String nameTeam = object.data['NameTeam'];
        String level = object.data['Level'];
        String address = object.data['Address'];
        String urlTeam = object.data['UrlTeam'];

        setState(() {
          nameTeams.add(nameTeam);
          levels.add(level);
          addresss.add(address);
          urlTeams.add(urlTeam);
        });
      }
    });
  }

  Future<void> readTeam() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Team');

    await collectionReference
        .document(uidLogin)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      print('document = ${documentSnapshot.data}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Around the World Team",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
        ),
        body: Container(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: <Widget>[
                        Card(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: InkWell(
                              onTap: () {
                                print("tapped");
                                print(nameTeams[index]);
                                print(levels[index]);
                                print(addresss[index]);
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => HomePage(
                                          currentIndex: 1,
                                          teamName: nameTeams[index],
                                          teamLevel: levels[index],
                                          teamAddr: addresss[index]),
                                      transitionsBuilder:
                                          (c, anim, a2, child) =>
                                              FadeTransition(
                                                  opacity: anim, child: child),
                                      transitionDuration:
                                          Duration(milliseconds: 20)),
                                );
                              },
                              child: SizedBox(
                                  height: 100.0,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 45.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(nameTeams[index],
                                            style: TextStyle(fontSize: 15)),
                                        Text(addresss[index],
                                            style: TextStyle(fontSize: 12)),
                                        Text(levels[index],
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ))),
                        ),
                        Positioned(
                          top: .0,
                          left: .0,
                          right: .0,
                          child: Center(
                              child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                              urlTeams[index],
                            ),
                            backgroundColor: Colors.transparent,
                          )),
                        )
                      ],
                    );
                  },
                  itemCount: nameTeams.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                  )))
        ])));
  }
}
