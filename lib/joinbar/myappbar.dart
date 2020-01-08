import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/appbar_search_ex.dart';


class MyAppBar extends StatelessWidget {

  final double barHeight = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Container(child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Join Team',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 18.0
              ),
            ),

          ),),


          Container(child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
                child: Row (
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          children: <Widget>[
                         SizedBox.fromSize(size: Size(50, 50),
                            child: ClipOval(
                                child: Material(color: Colors.transparent,
                                        child: InkWell(splashColor:Colors.white,
                                            onTap: () {},
                                               child: Column(mainAxisAlignment:
                                                   MainAxisAlignment.center,
                                                    children: <Widget>[
                                                         Icon(Icons.person_add,size: 28,color: Colors.lightGreenAccent,),
                                                           RichText(textAlign:TextAlign.center,
                                                              text: TextSpan(text:"Join",
                                                                  style:TextStyle(fontSize: 8, color: Colors.lightGreenAccent
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ))))),
                          ]
                      )
                    ]

            ),

              )
          ),

        ],
      ),
    );
  }
}