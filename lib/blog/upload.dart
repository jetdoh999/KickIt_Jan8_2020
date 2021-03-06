import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_ui_designs/blog/home.dart';


class UploadPhotoPage extends StatefulWidget {
  @override
  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  File sampleImage;
  String _myValue;
  String url;
  final formKey = GlobalKey<FormState>();


  Future getImage() async{
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
    });
  }

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }
  
  void uploadStatusImage() async{
    if(validateAndSave())
    {
      final StorageReference postImageRef = FirebaseStorage.instance.ref().child("Post Images");
    
      var timeKey = DateTime.now();

      final StorageUploadTask uploadTask = postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);
    
      var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

      url =ImageUrl.toString();

      print("Image Url = " + url);

      goToHomePage();

      saveToDatabase(url);

    }
  }

  void saveToDatabase(url){

    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('MMM d, yyyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {
      "image": url,
      "description": _myValue,
      "date": date,
      "time": time,
    };

    ref.child("Posts").push().set(data);

  }

  void goToHomePage(){
    Navigator.push(
              context,
                MaterialPageRoute(
                builder: (context) 
                {
                return HomePage();
                }
        )
     );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.1),
          elevation: 0,
          title: Text(
            'Upload Image',
            style: TextStyle(
                fontSize: 20.0, fontFamily: 'Billabong', color: Colors.black),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            child: Container(
              height: 1.0,
              color: Colors.grey[800],
            ),
            preferredSize: Size.fromHeight(1.0),
          ),
          leading: IconButton(
            onPressed: () {
                          Navigator.pop(context,
                              MaterialPageRoute(builder: (_) => HomePage()));
                        },
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 22.0,
            color: Colors.black,
          ),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.add_a_photo),
                    color: Colors.black,
                    iconSize: 25.0,
                    onPressed: getImage,
                    tooltip: 'Add Image',
            ),
            ],

            ),
          ],
        ),
        


        body: Center(
          child: sampleImage == null? Text("Select an Image"): enableUpload(),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_a_photo),
            tooltip: 'Add Image',
            onPressed: getImage,

          ),
     );
  }


   Widget enableUpload(){
   return Container(
     key: formKey,
     child: Column(
       children: <Widget>[
         Image.file(sampleImage, height: 330, width: 600,),
         SizedBox(height: 15,),
         TextFormField(
           decoration: InputDecoration(labelText: 'Description'),
           validator: (value){
             return value.isEmpty ? 'Blog Description is required' : null;
           },
           onSaved: (value){
            return _myValue = value; 
           }
         ),
         SizedBox(height: 15,),
         RaisedButton(
           elevation: 10,
           child: Text("Add a New Post"),
           textColor: Colors.white,
           color: Colors.pink,
           onPressed: uploadStatusImage,
         )
       ],
     ),

   );
   }

  }