import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:like_button/like_button.dart';
import 'package:share/share.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui_designs/login/login_screen.dart';




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: HomeScreen()));
  }
}

class HomeScreen extends StatefulWidget {
  createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  getDate(DateTime inputVal) {
    String processedDate;
    processedDate = inputVal.year.toString() +
        '-' +
        inputVal.month.toString() +
        '-' +
        inputVal.day.toString();

    return processedDate;
  }
  

  Future<void> signOutProcess() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Center(
        child: Card(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: Colors.white,
            elevation: 3.0,
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onLongPress: () {},
                onTap: () {},
                child: Container(
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      height: 50,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/atro/logo.png"),
                                              fit: BoxFit.fitWidth))),
                                  Text(
                                    (document['time']),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 0,
                                  right: 0,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/loader7.gif',
                                  image: document['image'],
                                ),
                              ),
                              SizedBox(
                                height: 14.0,
                              ),
                              Text(
                                document['title'],
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                document['subtitle'],
                                overflow: TextOverflow.fade,
                                maxLines: 99,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.share),
                                      onPressed: () => Share.share(
                                          "https://web.facebook.com/ekachai.sanharn"),
                                      iconSize: 20,
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.redAccent,
                                        ),
                                        iconSize: 20,
                                        onPressed: () {
                                          Firestore.instance.runTransaction(
                                              (transaction) async {
                                            DocumentSnapshot freshSnap =
                                            await transaction.get(document.reference);
                                            await transaction
                                                .update(document.reference, {
                                              'votes': freshSnap['votes'] + 1,
                                            });
                                          });
                                        }
                                        ),
                                        
                                    Text(document['votes'].toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        )),
                                  ])
                            ]))))));
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

   @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Feed News',
          style: TextStyle(
           
            color: Colors.black,
            fontSize: 20,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.exit_to_app),
            iconSize: 22.0,
            color: Colors.black,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
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
                    CircleAvatar(
                radius: 50.0,
                backgroundImage:
                    NetworkImage("${user?.photoUrl}"),
                backgroundColor: Colors.transparent,
              ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${user?.displayName}",
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
                          "Team Supported",
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
                        padding: const EdgeInsets.all(0.0),
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Sign Out'),
                          subtitle: Text('Back to Homepage'),
                          onTap: () {
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
      body: StreamBuilder(
          stream: Firestore.instance.collection('Admin').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData){
              return const Center(
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator(
                    value: null,
                    strokeWidth: 5.0,
                  ),
                ),
              );}
            else{
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );}
          }),
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
          likeCount: 0,
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
          width: 45,
          height: 45,
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
              height: 5,
            ),
            Text(
              feedTime,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        )
      ]),
    );
  }
}
