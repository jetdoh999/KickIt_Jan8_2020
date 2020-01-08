import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/myteambar/index.dart';

class LiveTrading extends StatelessWidget {
  LiveTrading(this.liveCrypto);
  final List<Crypto> liveCrypto;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: liveCrypto.length,
      itemBuilder: _buildCrypto,
    );
  }

  Widget _buildCrypto(BuildContext context, int index) {
    return Container(
        height: 85,
            child: Card(
                elevation: 5.0,
                child: InkWell(
                  onTap: () => print("Container pressed"),

                 child: Row(
                   mainAxisSize: MainAxisSize.max,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                   Container(
                     child: Row(
                       children: <Widget>[
                       SizedBox(width: 15.0),
                       CircleAvatar(
                       radius: 25.0,
                       backgroundImage: AssetImage(liveCrypto[index].iconImage,),
                        ),

                        SizedBox(width: 15.0),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[

                          Text(
                          liveCrypto[index].name,
                            style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w500),),

                          Text(
                          liveCrypto[index].age.toString(),
                          style: TextStyle(color: Colors.black54, fontSize: 14.0, ),)
                      ]
                  ),
                ]
            )
            ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                        liveCrypto[index].level.toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                        fontSize: 18.0
                 ),
               ),
                        SizedBox(width: 20.0),
             ]
         )
        ),
          ]
      ),
    )
    )
        );
  }
}