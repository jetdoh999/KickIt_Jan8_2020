import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/one.dart';

class SevenTab extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _SevenTabState();
  }
}

class _SevenTabState extends State<SevenTab> {
  String uidLogin, urlPathImage, channelName;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  TextEditingController editingController = TextEditingController();
  List<String> imgpath = List<String>();

  @override
  void initState() {
    imgpath.clear();
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  getPhoto(String uid) async {
    String imgPath;
    await Firestore.instance
        .collection('Avatar')
        .document(uid)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      imgPath = documentSnapshot.data['PathURL'];
      print(imgPath);
    });
    return imgPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "All Player",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.lightGreen,
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
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("User").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Loading..."),
                        SizedBox(
                          height: 50.0,
                        ),
                        CircularProgressIndicator()
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (_, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: Material(
                              color: Colors.transparent,
                              elevation: 0,
                              child: InkWell(
                                  splashColor: Colors.black12,
                                  onTap: () {
                                    String uid = snapshot.data.documents
                                        .elementAt(index)
                                        .documentID;
                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (BuildContext context) =>
                                                OneTab(friendUid: uid)));
                                  },
                                  child: Container(
                                      height: 140,
                                      width: 200,
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          color: Colors.transparent,
                                          elevation: 0,
                                          child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Container(
                                                  child: Row(
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    child: FutureBuilder<
                                                            dynamic>(
                                                        future: Firestore
                                                            .instance
                                                            .collection(
                                                                'Avatar')
                                                            .document(snapshot
                                                                .data.documents
                                                                .elementAt(
                                                                    index)
                                                                .documentID)
                                                            .get(),
                                                        builder: (BuildContext
                                                                context,
                                                            AsyncSnapshot<
                                                                    dynamic>
                                                                snapshot) {
                                                          return snapshot
                                                                      .data !=
                                                                  null
                                                              ? Image.network(
                                                                  snapshot.data[
                                                                      'PathURL'],
                                                                  fit: BoxFit
                                                                      .cover)
                                                              : Image.asset(
                                                                  'assets/default.png',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 100,
                                                                );
                                                        }),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        snapshot
                                                            .data
                                                            .documents[index]
                                                            .data["profileName"],
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data
                                                            .documents[index]
                                                            .data["nameTeam"],
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data
                                                            .documents[index]
                                                            .data["position"],
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 17,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data
                                                            .documents[index]
                                                            .data["shirtNumber"],
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 17,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ))))))));
                    },
                  );
                }
              },
            ),
          ),
        ])));
  }
}
