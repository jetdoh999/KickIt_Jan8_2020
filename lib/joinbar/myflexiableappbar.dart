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

    return  Container(
      padding:  EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45,),


                    Container(
                        width: 80,
                        height: 80,
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

                    Container(child:  Text(
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
                      child:  Text(
                          "Muang, Rayong, Thailand",
                          style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'OpenSans',
                              fontSize: 15.0
                          )
                      ),
                    ),),
                    SizedBox(width: 15),

                    Container(child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child:  Text(
                          "25 Member",
                          style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'OpenSans',
                              fontSize: 14.0
                          )
                      ),
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