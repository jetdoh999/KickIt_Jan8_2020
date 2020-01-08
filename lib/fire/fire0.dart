import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_ui_designs/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_formatter/time_formatter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> signOutProcess()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response){
      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context)=>LoginScreen());
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route)=>false);
    });
  }

  
String formatted = formatTime(
    DateTime.now().subtract(Duration(hours: 2)).millisecondsSinceEpoch);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  Text(
          "News from Admin",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('post').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              const Text('Loading');
            } else {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot mypost = snapshot.data.documents[index];
                  return Stack(children: <Widget>[
                    Column(children: <Widget>[
                      Container(
                        height: 370,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Material(
                            color: Colors.white,
                            elevation: 14,
                            shadowColor: Colors.black54,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 210,
                                      child: Image.network(
                                        '${mypost['image']}',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                        height: 55,
                                        color: Colors.transparent,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:MainAxisAlignment.spaceBetween,

                                                children: <Widget>[
                                                  makeFeed(
                                                    userName: 'KickIts Admin',
                                                    userImage: 'assets/Ton.jpg',
                                                    feedTime: '${mypost['time']}',
                                                  ),
                                                  likeButton(),
                                                ],
                                              ),
                                            ]
                                            )
                                            ),
                                    SizedBox(
                                      height: 5,
                                    ),         
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                        child: Text(
                                          '${mypost['title']}',
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                        )],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                        child: Text(
                                          '${mypost['subtitle']}',
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])
                  ]);
                },
              );
            }
          }),
          drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 90.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Account Name",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "See profile",
                        style: TextStyle(color: Colors.black45),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 16.0, 40.0, 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Admin",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Donate",
                          style: TextStyle(fontSize: 18.0, color: Colors.teal),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Supported By",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Sign Out'),
                          subtitle: Text('Sign Out and Back Home'),
                          onTap: (){
                            signOutProcess();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget likeButton() {
    return Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.transparent)),
        child: Center(
            child: LikeButton(
          size: 25,
          circleColor: CircleColor(start: Colors.red, end: Colors.redAccent),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Colors.red,
            dotSecondaryColor: Colors.redAccent,
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.favorite,
              color: isLiked ? Colors.redAccent : Colors.grey,
              size: 25,
            );
          },
          likeCount: 956,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.black : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "love",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          },
        )));
  }

  Widget makeFeed({userName, userImage, feedTime}) {
    return Container(
      child: Row(children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(userImage), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              userName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              feedTime,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ],
        )
      ]),
    );
  }
}
