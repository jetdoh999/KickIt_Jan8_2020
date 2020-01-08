
import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/sliver/crypto_api.dart';
import 'package:flutter_ui_designs/sliver/profile_card.dart';
import 'package:flutter_ui_designs/sliver/live_trading.dart';
import 'package:flutter_ui_designs/appbar_search_ex.dart';


class SliverAppbar extends StatefulWidget {
  @override
  _SliverAppbarState createState() {
    return _SliverAppbarState();
  }
}

class _SliverAppbarState extends State<SliverAppbar> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              leading: IconButton(
                tooltip: 'Back',
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: (){
                  Navigator.pop(context);},
              ),

              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'My Team', style: TextStyle(color: Colors.black),
                    ),

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
                                      icon: Icon(Icons.filter_center_focus),
                                      color: Colors.black,
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => AppBarSearchExample()));
                                      },
                                    ),
                                  ),
                                ]
                            )
                          ]
                      ),
                    )
                    ),
                  ]
              ),
            ),


            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      background: ProfileCard()),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [SliverListDetail()],
                  ),
                ),
                SliverFillRemaining(
                    child: LiveTrading(testCrypto))
              ],
            )));
  }

  Widget SliverListDetail() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text('LIVE TRADING'),
            ),
            Container(
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Text(
                  'Buy',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            )
          ]),
    );
  }
}