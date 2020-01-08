import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_ui_designs/blog/upload.dart';
import 'package:flutter_ui_designs/blog/Posts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<Posts> postList = [];

@override
void initState(){
  super.initState();

  DatabaseReference postsRef = FirebaseDatabase.instance.reference().child("Posts");
  
  postsRef.once().then((DataSnapshot snap)
  {
  var KEYS = snap.value.keys;
  var DATA = snap.value;

  postList.clear();

  for(var individualKey in KEYS){

    Posts posts =  Posts
    (
      DATA[individualKey]['image'],
      DATA[individualKey]['description'],
      DATA[individualKey]['date'],
      DATA[individualKey]['time'],
    );

    postList.add(posts);
  }
    setState(() 
    {
      print('Length : $postList.length');
    });
  }
  );

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        elevation: 0,
        title: Text(
          'Home',
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
          onPressed: () {},
          icon: Icon(MdiIcons.commentOutline),
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UploadPhotoPage();
                  }));
                },
              ),
            ],
          ),
        ],
      ),
      body: Container(
         child: postList.length == 0 ? Text("No Blog Post available") : ListView.builder(
         itemCount: postList.length,
         itemBuilder: (_, index){
           return PostsUI(
             postList[index].image,
             postList[index].description,
             postList[index].date,
             postList[index].time,
            );
         },
         ),
      
      ),
    );
  }
  Widget PostsUI(String image, String description, String date, String time,)
  {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text(date, style: Theme.of(context).textTheme.subtitle, 
            textAlign: TextAlign.center,
            ),
            Text(time, style: Theme.of(context).textTheme.subtitle, 
            textAlign: TextAlign.center,
            ),
              ],

            ),
            SizedBox(height: 10,),
            Image.network(image, fit:BoxFit.cover),
            SizedBox(height: 10,),
            Text(description, style: Theme.of(context).textTheme.subhead, 
            textAlign: TextAlign.center,
            ),
          ],
          ),
      ),
    );
  }
}
