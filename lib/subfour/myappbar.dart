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
              'My Team',
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
                         Container(
                           width: 30,
                             child: IconButton(
                               icon: Icon(Icons.search),
                               color: Colors.white,
                               onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (_) => AppBarSearchExample()));
                               },
                             ),

                         ),
                            Container(
                              width: 30,
                                child: PopupMenuButton(
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem(child: Text('Edit Team Logo')),
                                      PopupMenuItem(child: Text('Edit Team Details')),
                                      PopupMenuItem(child: Text('Assign Admin'))
                                    ];
                                  },
                                )
                            )
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