import 'package:flutter/material.dart';

class Member {
  String uid;
  String name;
  String profileImg;
  String position;
  String age;
  String no;

  Member(
      {@required this.uid,
      @required this.position,
      @required this.age,
      @required this.name,
      @required this.no,
      this.profileImg = "https://i.imgur.com/58Yb1yS.jpg"});
}
