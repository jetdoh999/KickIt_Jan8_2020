import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/log/model/memberModel.dart';

class Joins extends StatefulWidget {
  final String teamID;

  Joins({Key key, @required this.teamID}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Joins();
  }
}

enum MyDialogAction { yes, no }

void _dialogResult(MyDialogAction value) {
  print('You selected $value');
}

class _Joins extends State<Joins> {
  String uidLogin;

  Future<void> findUID() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((object) {
      uidLogin = object.uid;
    });
  }

  List<Member> requestList = List<Member>();
  List<String> memberTeam = List<String>();

  readAllDataUser(String uid) async {
    Firestore firestore = Firestore.instance;

    CollectionReference collectionReference = firestore.collection('User');
    await collectionReference
        .document(uid)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      // print(documentSnapshot.data);

      var result = documentSnapshot.data;

      String name = result['profileName'];
      String age = result['age'];
      String position = result['position'];
      String number = result['shirtNumber'];

      Member member = Member(
          uid: uid, name: name, age: age, position: position, no: number);

      setState(() {
        requestList.add(member);
      });
    });
  }

  Future<void> getRequestList() async {
    requestList.clear();
    CollectionReference collectionReference =
        Firestore.instance.collection('Team');

    collectionReference
        .document(widget.teamID)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      for (var i = 0; i < documentSnapshot.data['requestMember'].length; i++) {
        readAllDataUser(documentSnapshot.data['requestMember'][i]);
      }
    });
  }

  removeRequestList(Member member) async {
    List<String> requestTemp = List<String>();
    setState(() {
      requestList.remove(member);
      requestList.forEach((Member OnValue) {
        requestTemp.add(OnValue.uid);
      });

      Firestore.instance
          .collection('Team')
          .document(widget.teamID)
          .updateData({'requestMember': requestTemp});
    });
  }

  addNewMember(String uid) async {
    print("is member 02 $memberTeam}");

    await Firestore.instance
        .collection('Team')
        .document(widget.teamID)
        .updateData({'MemberTeam': memberTeam});
  }

  listMemberTeam(String uid) {
    var list = List<String>();
    list.add(uid);
    Firestore.instance
        .collection('Team')
        .document(widget.teamID)
        .updateData({"MemberTeam": FieldValue.arrayUnion(list)});

    // Firestore firestore = Firestore.instance;
    // CollectionReference collectionReference = firestore.collection('Team');
    // List<dynamic> list;

    // memberTeam.clear();
    // collectionReference
    //     .document(widget.teamID)
    //     .snapshots()
    //     .listen((DocumentSnapshot documentSnapshot) {
    //   list = List.from(documentSnapshot.data['MemberTeam']);
    //   list.add(uid);
    // });
    // await collectionReference
    //     .document(widget.teamID)
    //     .updateData({"MemberTeam": FieldValue.arrayUnion(list)});
  }

  AlertDialog dialog = AlertDialog(
    content:
        Text("Confirm to join the team?", style: TextStyle(fontSize: 20.0)),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.yes);
          },
          child: Text('Yes'),
          color: Colors.green,
          textColor: Colors.white),
      FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.no);
          },
          child: Text('No'),
          color: Colors.red,
          textColor: Colors.white),
    ],
  );

  AlertDialog dialogs = AlertDialog(
    content: Text(
      "Do you want to cancel?",
      style: TextStyle(fontSize: 20.0),
    ),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.yes);
          },
          child: Text('Yes'),
          color: Colors.green,
          textColor: Colors.white),
      FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.no);
          },
          child: Text('No'),
          color: Colors.red,
          textColor: Colors.white),
    ],
  );

  @override
  void initState() {
    requestList.clear();
    memberTeam.clear();

    getRequestList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    Widget requestListResult() {
      return ListView.builder(
          itemCount: requestList.length,
          itemBuilder: (BuildContext context, int index) {
            var item = requestList[index];

            return Container(
                height: 145,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 5.0,
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    ListTile(
                        leading: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage("assets/Ton.jpg")),
                        title: Text(item.name),
                        subtitle: Text('${item.position}, No.${item.no}'),
                        trailing: Text('Age ${item.age}')),
                    ButtonTheme.bar(
                        child: ButtonBar(children: <Widget>[
                      FlatButton(
                          child: Text('Accept'),
                          textColor: Colors.green,
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                        content: Text("Add User",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600)),
                                        actions: [
                                          CupertinoDialogAction(
                                              child: Text('ok'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                removeRequestList(item);
                                                listMemberTeam(item.uid);
                                              })
                                        ]));
                          }),
                      FlatButton(
                          child: Text('Cancel'),
                          textColor: Colors.red,
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                        content: Text("Cancel",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600)),
                                        actions: [
                                          CupertinoDialogAction(
                                              child: Text('yes'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                removeRequestList(item);
                                              }),
                                          CupertinoDialogAction(
                                              child: Text('no'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              })
                                        ]));
                          })
                    ])),
                  ]),
                ));
          });
    }

    return Container(
        width: screenWidth,
        height: screenHeight * 0.85,
        child: requestListResult());
  }
}
