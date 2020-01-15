import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Joins extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Joins();
  }
}

enum MyDialogAction {
  yes,
  no,
}

void _dialogResult(MyDialogAction value) {
  print('You selected $value');
}

class _Joins extends State<Joins> {
  String uidLogin;
  List<String> valueTeam = List();

  Future<void> findUID() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((object) {
      uidLogin = object.uid;
      print("uid is $uidLogin");

      readAllDataUser();
    });
  }

  Future<void> readAllDataUser() async {
    Firestore firestore = Firestore.instance;

    CollectionReference collectionReference = firestore.collection('User');
    await collectionReference
        .document(uidLogin)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      print('document = ${documentSnapshot.data}');

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

  AlertDialog dialog = AlertDialog(
    content: Text(
      "Confirm to join the team?",
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
  Widget build(BuildContext context) {
    return Container(
        height: 145,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 5.0,
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            const ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage("assets/Ton.jpg"),
              ),
              title: Text('Ekachai Ton'),
              subtitle: Text('Midfielder, No.69'),
              trailing: Text('Age 39'),
            ),
            ButtonTheme.bar(
                child: ButtonBar(
              children: <Widget>[
                FlatButton(
                    child: Text('Accept'),
                    textColor: Colors.green,
                    onPressed: () {
                      showDialog(context: context, child: dialog);
                    }),
                FlatButton(
                    child: Text('Cancel'),
                    textColor: Colors.red,
                    onPressed: () {
                      showDialog(context: context, child: dialogs);
                    }),
              ],
            )),
          ]),
        ));
  }
}
