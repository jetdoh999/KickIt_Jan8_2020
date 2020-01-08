import 'package:flutter/material.dart';


class MyFlexiableAppBar extends StatelessWidget {

  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.transparent, width: 1),
                            image: DecorationImage(
                                image: AssetImage("assets/Club.jpg"),
                                fit: BoxFit.cover
                            )
                        )
                    ),

                    Container(child: new Text(
                        "ทีมไหน FC",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 24.0
                        )
                    ),),
                  ],),),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: new Text(
                          "อ.เมือง",
                          style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'OpenSans',
                              fontSize: 18.0
                          )
                      ),
                    ),),
                    SizedBox(width: 15),

                    Container(child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: new Text(
                          "จ.ระยอง",
                          style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'OpenSans',
                              fontSize: 18.0
                          )
                      ),
                    ),),
                    SizedBox(width: 15),


                    Container(child: Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: new Text(
                          "25",
                          style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'OpenSans',
                              fontSize: 18.0
                          )
                      ),
                    ),
                    ),
                    SizedBox(width: 1),

                    Container(child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Icon(
                        Icons.people, color: Colors.green,),
                    ),
                    ),


                  ],
                ),
              ),

                 ]
               ),
      )
    );

  }
}