import 'dart:async';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';
import 'package:flutter_ui_designs/utility/my_alert.dart';

import 'package:image_picker/image_picker.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  State createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  // Field
  File avatarImageFile, backgroundImageFile;
  String sex;
  
  List<String> myData = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  List<String> keyData = [
    'profileName',
    'nameTeam',
    'shirtNumber',
    'position',
    'foot',
    'age',
    'height',
    'weight',
    'speed',
    'kick',
    'pass',
    'curve',
    'stamina',
    'jump'
  ];

  String uidLogin;

  final formKey = GlobalKey<FormState>();

  // Method
  @override
  void initState() { 
    super.initState();
    findUidLogin();
    
  }

  Future<void> readAllUser()async{
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('User');
    await collectionReference.document(uidLogin).snapshots().listen((DocumentSnapshot documentSnapshot){
      print('documentSnapshopt = ${documentSnapshot.data}');
      if (documentSnapshot.data != null) {
        
        
        int index = 0;
        for (var key in keyData) {
          
          String string = documentSnapshot.data[key];
          setState(() {
            myData[index] = string;
          });
          print('myData[$index] = ${myData[index]}');
          index ++;
        }

      }
    });
  }


  Future getImage(bool isAvatar) async {
    var result = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (isAvatar) {
        avatarImageFile = result;
      } else {
        backgroundImageFile = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            
            mainForm('Profile Name', 'Type Profile Name', 0),
            mainForm('Name Team', 'Type Profile Name', 1),
            mainForm('Shirt Number', 'Type Profile Name', 2),
            mainForm('Position', 'Type Profile Name', 3),
            mainForm('Foot', 'Type Profile Name', 4),
            mainForm('Age', 'Type Profile Name', 5),
            mainForm('Height', 'Type Profile Name', 6),
            mainForm('Weight', 'Type Profile Name', 7),
            mainForm('Speed', 'Type Profile Name', 8),
            mainForm('Kick', 'Type Profile Name', 9),
            mainForm('Pass', 'Type Profile Name', 10),
            mainForm('Curve', 'Type Profile Name', 11),
            mainForm('Stamina', 'Type Profile Name', 12),
            mainForm('Jump', 'Type Profile Name', 13),
            uploadButton(),
            SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
      padding:  EdgeInsets.only(bottom: 20.0),
    );
  }

  Widget uploadButton() {
    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      // color: Colors.grey,
      child: OutlineButton(
        child: Text('Upload'),
        onPressed: () {
          formKey.currentState.save();
          int index = 0;
          bool status = false;
          for (var data in myData) {
            print('myData[$index] = $data');

            if (data.isEmpty) {
              status = true;
            }

            index++;
          }

          if (status) {
            normalDialog(context, 'Have Space', 'Please Fill all Blank');
          } else {
            uploadToFirestore();
          }
        },
      ),
    );
  }

  Future<void> findUidLogin() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    if (firebaseUser != null) {
      uidLogin = firebaseUser.uid;
      print('uidLogin = $uidLogin');
      readAllUser();
    }
  }

  Future<void> uploadToFirestore() async {
    Map<String, dynamic> map = Map();
    int index = 0;
    for (var string in myData) {
      map[keyData[index]] = string;
      index++;
    }

    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('User');

    await collectionReference
        .document(uidLogin)
        .setData(map)
        .then((response) {
          print('Success Upload');
          Navigator.of(context).pop();
        });

    // await collectionReference
    //     .document(uidLogin)
    //     .updateData({'prifileName': 'test Edit Master'}).then((response) {
    //   print('Success Upload');
    //   Navigator.of(context).pop();
    // });
  }

  Container mainForm(String label, String hint, int index) {
    return Container(
      child: TextFormField(controller: TextEditingController(text: myData[index]),
        onSaved: (String string) {
          myData[index] = string.trim();
        },
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black87),
            hintText: hint,
            border: UnderlineInputBorder(),
            contentPadding: EdgeInsets.all(5.0),
            hintStyle: TextStyle(color: Colors.grey)),
      ),
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
    );
  }

  

  

  
}
