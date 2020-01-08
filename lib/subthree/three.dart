import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';




class ThreeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThreeTab();
  }
}

class _ThreeTab extends State<ThreeTab> {
  // Field


  String uidLogin;
  List<String> nameTeams = List();
  List<String> levels = List();
  List<String> addresss = List();
  List<String> urlTeams = List();

  // Method

  @override
  void initState() {
    
    super.initState();

    findUid();
  }

  Future<void> findUid() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    uidLogin = firebaseUser.uid;

    readAllTeam();

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
      appBar:  AppBar(
        title:  Text(
          "Worldwide Team",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.black54,
        
      ),
      body: ListView.builder(
        itemCount: nameTeams.length, 
        itemBuilder: (BuildContext context, int index) {
        return Container(
        height: 90,
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(nameTeams[index],
                    style: TextStyle(fontSize: 15)
                    ),
                    Text(addresss[index],
                    style: TextStyle(fontSize: 12)
                    ),
                    Text(levels[index],
                    style: TextStyle(fontSize: 11)
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(urlTeams[index],
                        )
                        ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
      }));}}
  