import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Team.jpg"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                    Container(
                        width: 50,
                        height: 50,
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

            ]
        ),
      ),
    );
  }
}