import 'package:flutter/material.dart';

import 'package:flutter_ui_designs/sliver/crypto.dart';


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

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   CircleAvatar(
                     radius: 25.0,
                     backgroundImage: AssetImage(liveCrypto[index].iconImage,),
                   ),

                    Text(
                      liveCrypto[index].name,
                      style: TextStyle(
                          fontSize: 20.0
                      ),),
                    Text(
                      '\$' + liveCrypto[index].price.toString(),
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                    Text(
                      liveCrypto[index].level,
                      style: TextStyle(
                          fontSize: 20.0
                      ),),
                  ]))
        ],
      ),
    );
  }
}