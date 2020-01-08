import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_ui_designs/subfour/myflexiableappbar.dart';
import 'package:flutter_ui_designs/subfour/myappbar.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';


class Subsub extends StatefulWidget {
  @override
  _SubsubState createState() {
    return _SubsubState();
  }
}

class _SubsubState extends State<Subsub> {
  List<double> data1 = [1.0, 1.1, 1.0, 1.2, 1.3, 1.3, 1.3, 1.3];
  List<double> data2 = [0.8, 0.7, 1.0, 0.9, 0.2, 1.3, 1.6, 0.8, 0.3, 0.0];
  List<double> data3 = [1.0, 1.1, 1.0, 0.9, 1.2, 1.2, 1.3, 1.4];
  List<double> data4 = [0.4,0.5,0.6,1.0,1.0,0.9,0.6,0.5];
  List<double> data5 = [1.0, 1.1, 1.0, 0.9, 1.2, 1.3, 0.8,1,2];
  List<double> data6 = [0.8,0.9,0.7,0.6,0.8,0.9];
  List<double> data7 = [0.2,0.3,0.6,1.0,0.6,0.3,0.2];
  List<double> data8 = [1.0,1.1,1.2,1.3,1.4,1.2,1.3];
  List<double> data9 = [1.0, 1.1, 1.0, 0.9, 1.2, 1.3, 1.0, 0.8, 1.3, 1.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: MyAppBar(),
              pinned: true,
              expandedHeight: 220.0,
              backgroundColor: Colors.black87.withBlue(7),

              flexibleSpace: FlexibleSpaceBar(
                background: MyFlexiableAppBar(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  myCardDetails(
                      "assets/T.jpg", "Ekachai Ton", data1, "89", "Admin", "", 0xff07862b),
                  myCardDetails(
                      "assets/Ton.jpg", "Ekachai Ton", data2, "85", "Member", "", 0xffff0000),
                  myCardDetails(
                      "assets/Ohh.jpg", "Ekachai Ton", data3, "77", "Member", "", 0xffff0000),
                  myCardDetails(
                      "assets/Ton.jpg", "Ekachai Ton", data7, "83", "Member", "", 0xffff0000),

                  myCardDetails(
                      "assets/Ton.jpg", "Ekachai Ton", data5, "99", "Member", "", 0xffff0000),
                  myCardDetails(
                      "assets/Ton.jpg", "Ekachai Ton", data6, "80", "Member", "", 0xffff0000),
                  myCardDetails(
                      "assets/Ton.jpg", "Ekachai Ton", data4, "68", "Member", "", 0xffff0000),
                  myCardDetails(
                      "assets/Ton.jpg", "Ekachai Ton", data8, "78", "Member", "", 0xffff0000),
                  myCardDetails(
                      "assets/Ton.jpg", "Ekachai Ton", data9, "65", "Member", "", 0xffff0000),

                ],
              ),
            ),
          ],
        )
    );
  }

}

Widget myCardDetails(String imageVal, String currencyName, List<double> data,
    String currencyVal, String currencyPercentage, String currencyStatus,
    int colorVal) {
  return Padding(
    padding: const EdgeInsets.all(7.0),
    child: Material(
      color: Colors.white,
      elevation: 11.0,
      borderRadius: BorderRadius.circular(10.0),
      shadowColor: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: myCurrencies(
            imageVal,
            currencyName,
            data,
            currencyVal,
            currencyPercentage,
            currencyStatus,
            colorVal),
      ),
    ),
  );

}

Center myCurrencies(String imageVal, String currencyName, List<double> data,
    String currencyVal, String currencyPercentage, String currencyStatus,
    int colorVal) {
  return Center(

      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10.0,),
              myLeadingDetails(imageVal, currencyName),
              SizedBox(width: 30.0,),
              myGraphDetails(data),
              SizedBox(width: 50.0,),
              myCurrenciesDetails(
                  currencyVal, currencyPercentage, currencyStatus, colorVal),
            ],)
        ],)
  );
}


Widget myLeadingDetails(String imageVal, String currencyName) {
  return Container(
      child: Row(children: <Widget>[
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.transparent, width: 1),
                image: DecorationImage(
                    image: AssetImage(imageVal),
                    fit: BoxFit.cover
                )
            )
        ),
        SizedBox(width: 10.0,),
        Container(child: Text(
          currencyName, style: TextStyle(
            color: Color(0xff3a2483),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 16.0
        ),),),
      ],)
  );
}

Widget myGraphDetails(List<double> data) {
  return Container(
    width: 80.0,
    height: 50.0,
    child: Sparkline(
      data: data,
      lineColor: Color(0xff013db7),
      fillMode: FillMode.below,
      fillColor: Colors.blue[100],
    ),
  );
}

Widget myCurrenciesDetails(String currencyVal, String currencyPercentage,
    String currencyStatus, int colorVal) {
  return Container(child: Column(
    children: <Widget>[
      Container(child: Text(
          "" + currencyVal,
          style: TextStyle(
              color: Color(0xff3a2483),
              fontFamily: 'Opensans',
              fontWeight: FontWeight.w800,
              fontSize: 18.0
          )
      ),),
      Container(child: Text(
          currencyPercentage + "" + currencyStatus,
          style: TextStyle(
            color: Color(colorVal),
            fontFamily: 'Opensans',
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
          )
      ),),
    ],
  ));
}