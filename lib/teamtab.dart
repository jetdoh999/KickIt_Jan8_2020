import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';




class TeamTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TeamTab();
  }
}

class _TeamTab extends State<TeamTab> {
  // Field


  String uidLogin;
  List<String> nameMembers = List();
  List<String> ages = List();
  List<String> positions = List();
  List<String> urlMembers = List();
  
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

    readAllMember();

    // readTeam();
  }

  Future<void> readAllMember() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Member');
    
    await collectionReference.snapshots().listen((QuerySnapshot querySnapshot) {
      for (var object in querySnapshot.documents) {
        String nameMember = object.data['NameMember'];
        String age = object.data['Age'];
        String position = object.data['Position'];
        String urlMember = object.data['UrlMember'];
        

        setState(() {
          nameMembers.add(nameMember);
          ages.add(age);
          positions.add(position);
          urlMembers.add(urlMember);
          
        });
      }
    });
  }

  Future<void> readTeam() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Member');

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
          "Member",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.black54,
        
      ),
      body: ListView.builder(
        itemCount: nameMembers.length, 
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
                    Text(nameMembers[index],
                    style: TextStyle(fontSize: 15)
                    ),
                    Text(positions[index],
                    style: TextStyle(fontSize: 12)
                    ),
                    Text(ages[index],
                    style: TextStyle(fontSize: 11)
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(urlMembers[index],
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
  