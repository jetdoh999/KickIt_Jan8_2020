import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/three.dart';
import 'package:flutter_ui_designs/utility/my_alert.dart';

import 'package:image_picker/image_picker.dart';

class CreateTeam extends StatefulWidget {
  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  // Field
  File file;
  final formkey = GlobalKey<FormState>();
  String nameTeam, address, level, urlTeam, uidLogin;
  List<String> memberList = List<String>();

  // Method
  @override
  void initState() {
    super.initState();
    findUid();
    print('uidLogin = $uidLogin');
  }

  Future<void> findUid() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    uidLogin = firebaseUser.uid;
  }

  Future<void> uploadImageToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String nameImage = 'team$i.jpg';

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('TeamAvatar/$nameImage');
    StorageUploadTask storageUploadTask = storageReference.putFile(file);
    await (await storageUploadTask.onComplete)
        .ref
        .getDownloadURL()
        .then((response) {
      urlTeam = response.toString();
      updateFireStore();
    });
  }

  Future<void> updateFireStore() async {
    Firestore firestore = Firestore.instance;
    memberList.add(uidLogin);

    Map<String, dynamic> map = Map();
    map['Address'] = address;
    map['Level'] = level;
    map['NameTeam'] = nameTeam;
    map['UrlTeam'] = urlTeam;
    map['MemberTeam'] = memberList;
    map['requestMember'] = [];

    print('uidLogin = $uidLogin');

    await firestore
        .collection('Team')
        .document(uidLogin)
        .setData(map)
        .then((response) {
      print('Create Team Success');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext buildContext) {
        return ThreeTab();
      });
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
          (Route<dynamic> route) {
        return false;
      });
    });
  }

  Future takeFile(ImageSource imageSource) async {
    var object = await ImagePicker.pickImage(
      source: imageSource,
      maxWidth: 800.0,
      maxHeight: 600.0,
    );
    setState(() {
      file = object;
    });
  }

  Widget cameraButton() {
    return IconButton(
      icon: Icon(Icons.add_a_photo),
      onPressed: () {
        takeFile(ImageSource.camera);
      },
    );
  }

  Widget galleryButton() {
    return IconButton(
      icon: Icon(Icons.add_photo_alternate),
      onPressed: () {
        takeFile(ImageSource.gallery);
      },
    );
  }

  Widget showButton() {
    return Container(
      margin: EdgeInsets.only(left: 40.0, right: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          cameraButton(),
          galleryButton(),
        ],
      ),
    );
  }

  Widget showText() {
    return Container(
      alignment: Alignment(0, 0),
      // color: Colors.grey,
      height: 200.0,
      child: Text('No Image'),
    );
  }

  Widget showChooseImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          // color: Colors.grey,
          height: 200.0,
          width: 200.0,
          child: ClipOval(
            child: Image.file(
              file,
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget showImageTeam() {
    return file == null ? showText() : showChooseImage();
  }

  Widget nameForm() {
    return Container(
      margin: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextFormField(
        onSaved: (String string) {
          nameTeam = string.trim();
        },
        decoration: InputDecoration(labelText: 'Name Team :'),
      ),
    );
  }

  Widget addressForm() {
    return Container(
      margin: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextFormField(
        onSaved: (String string) {
          address = string.trim();
        },
        decoration: InputDecoration(labelText: 'Address :'),
      ),
    );
  }

  Widget levelForm() {
    return Container(
      margin: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextFormField(
        onSaved: (String string) {
          level = string.trim();
        },
        decoration: InputDecoration(labelText: 'Level :'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Team'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: <Widget>[
            showImageTeam(),
            showButton(),
            nameForm(),
            addressForm(),
            levelForm(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud_upload),
        onPressed: () {
          formkey.currentState.save();
          if (file == null) {
            normalDialog(context, 'No Image', 'Please Choose Image');
          } else if (nameTeam.isEmpty || address.isEmpty || level.isEmpty) {
            normalDialog(context, 'Have Space', 'Please Fill Every Blank');
          } else {
            uploadImageToStorage();
          }
        },
      ),
    );
  }
}
