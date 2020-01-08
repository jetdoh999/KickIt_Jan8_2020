import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:multi_charts/multi_charts.dart';
import 'package:like_button/like_button.dart';

class OneTab extends StatefulWidget {
  @override
  _OneTabState createState() {
    return _OneTabState();
  }
}


class _OneTabState extends State<OneTab> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.5,
                    0.7,
                    0.9
                  ],
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.4),
                  ]),
            ),
            child: Stack(fit: StackFit.expand, children: <Widget>[
              Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Stack(children: <Widget>[
                                  Container(
                                    height: 771,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          stops: [
                                            0.6,
                                            0.7,
                                            0.8,
                                            0.9
                                          ],
                                          colors: [
                                            Colors.black.withOpacity(0.7),
                                            Colors.black.withOpacity(0.65),
                                            Colors.black.withOpacity(0.6),
                                            Colors.black.withOpacity(0.55),
                                          ]),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0)),
                                    ),
                                  ),
                                  Stack(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 35, right: 10),
                                      child: Container(
                                        height: 560,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4),
                                                topRight: Radius.circular(4),
                                                bottomLeft: Radius.circular(4),
                                                bottomRight:
                                                    Radius.circular(4)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/Soc.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    )
                                  ]),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 535, left: 20),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                stops: [
                                                  0.6,
                                                  0.7,
                                                  0.8,
                                                  0.9
                                                ],
                                                colors: [
                                                  Colors.black
                                                      .withOpacity(0.85),
                                                  Colors.black
                                                      .withOpacity(0.83),
                                                  Colors.black
                                                      .withOpacity(0.81),
                                                  Colors.black.withOpacity(0.8),
                                                ]),
                                          ),
                                          width: 220,
                                          height: 50,
                                          padding: EdgeInsets.only(
                                              left: 23, right: 23.0),
                                          child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "39\n",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "AGE",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "183\n",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "HEIGHT",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "80\n",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "WEIGHT",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]))),
                                  Stack(children: <Widget>[
                                    SizedBox(height: 60),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 35, right: 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(
                                            Icons.menu,
                                            color: Colors.black87,
                                          ),
                                          PopupMenuButton(
                                            itemBuilder:
                                                (BuildContext context) {
                                              return [
                                                PopupMenuItem(
                                                    child:
                                                        Text('Edit Picture')),
                                                PopupMenuItem(
                                                    child: Text(
                                                        'Edit Player Details')),
                                              ];
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                  Stack(children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 230, top: 400, right: 0),
                                        child: RadarChart(
                                          maxHeight: 220,
                                          labelColor: Colors.white,
                                          strokeColor:
                                              Colors.black12.withOpacity(0.1),
                                          values: [85, 90, 80, 60, 80, 72],
                                          labels: [
                                            "Kick",
                                            "Pass",
                                            "Curve",
                                            "Stamina",
                                            "Jump",
                                            "Speed",
                                          ],
                                          maxValue: 100,
                                          fillColor: Colors.blue,
                                        ))
                                  ]),
                                  Stack(children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, top: 605, right: 10),
                                        child: Container(
                                          height: 152,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                stops: [
                                                  0.6,
                                                  0.7,
                                                  0.8,
                                                  0.9
                                                ],
                                                colors: [
                                                  Colors.black.withOpacity(0.8),
                                                  Colors.black
                                                      .withOpacity(0.75),
                                                  Colors.black.withOpacity(0.7),
                                                  Colors.black
                                                      .withOpacity(0.65),
                                                ]),
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4),
                                                topRight: Radius.circular(4),
                                                bottomLeft: Radius.circular(4),
                                                bottomRight:
                                                    Radius.circular(4)),
                                          ),
                                        ))
                                  ]),
                                  Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 70),
                                            Row(children: <Widget>[
                                              Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/Flag.jpg"),
                                                          fit: BoxFit.cover))),
                                              Transform.translate(
                                                  offset: Offset(-8, 0),
                                                  child: makeLove()),
                                            ]),
                                            SizedBox(height: 20),
                                            Text(
                                              "Ekachai Ton",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40),
                                            ),
                                            Text(
                                              "ทีมไหน FC",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(height: 150),
                                            Row(children: <Widget>[
                                              Stack(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  children: <Widget>[
                                                    Container(
                                                        width: 35,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1),
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/Shirt.png"),
                                                                fit: BoxFit
                                                                    .cover))),
                                                    Stack(children: <Widget>[
                                                      Text(
                                                        "10",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13),
                                                      ),
                                                    ])
                                                  ]),
                                              Text(
                                                "Midfielder",
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 13),
                                              ),
                                            ]),
                                            SizedBox(height: 20),
                                          ])),
                                  Stack(children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                          top: 600,
                                        ),
                                        child: Row(children: <Widget>[
                                          Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Stack(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 0,
                                                          top: 0,
                                                          right: 0),
                                                      child: Stack(children: <
                                                          Widget>[
                                                        Container(
                                                            decoration:
                                                                BoxDecoration(
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.black87
                                                              .withOpacity(
                                                                  0.85),
                                                        )),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  top: 20,
                                                                  right: 15),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              makeFeed(
                                                                userName:
                                                                    'Ekachai Ton',
                                                                userImage:
                                                                    'assets/Ton.jpg',
                                                                feedTime:
                                                                    '1 hr ago',
                                                              ),
                                                              
                                                            ],
                                                          ),
                                                        ),
                                                      ]))
                                                ]),
                                                SizedBox(height: 56),
                                              ])
                                        ])),
                                  ]),

                                  Padding(
                                      padding: EdgeInsets.only(
                                      top: 612, right: 0,),
                                      child: Container(
                                        decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.transparent),
                                          height: 50,
                                          padding: EdgeInsets.only(
                                              left: 250, right: 0),
                                              child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[

                                        likeButton(),

                                              ]))),



                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 690, left: 20, right: 20),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.transparent),
                                          height: 50,
                                          padding: EdgeInsets.only(
                                              left: 23, right: 23.0),
                                          child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "72\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "SPEED",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "85\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "KICK",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "90\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "PASS",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "80\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "CURVE",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "60\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "STAM",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "80\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "JUMP",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]))),
                                ]),
                              )),
                        )
                      ]))
            ])));
  }

  Widget makeFeed({userName, userImage, feedTime}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1),
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
                  color: Colors.white,
                  fontSize: 18,
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

  Widget makeLike() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
      ),
    );
  }

  Widget makeLove() {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.transparent, width: 1),
            image: DecorationImage(
                image: AssetImage("assets/Club.jpg"), fit: BoxFit.cover)));
  }

Widget likeButton() {
    return Container(
      width: 80,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.transparent)),
          child: Center(
            child:LikeButton(
          size: 25,
          circleColor:
              CircleColor(start: Colors.red, end: Colors.redAccent),
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
          likeCount: 66665,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.white : Colors.grey;
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
}