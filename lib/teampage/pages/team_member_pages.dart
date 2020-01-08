import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/one.dart';

class TeamMembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black, 
          ),
        title: Text(
          "Our Team",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        elevation: 5.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
              onPressed: () {
              })
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    child: InkWell(
                        splashColor: Colors.black12,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => OneTab()));
                        },
                        child: Container(
                            height: 140,
                            width: 200,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                color: Colors.transparent,
                                elevation: 0,
                                child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                        child: Row(
                                      children: <Widget>[
                                        
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          child: Image.asset(
                                            'assets/default.png',
                                            fit: BoxFit.cover,
                                            width: 100,
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "Ekachai Ton",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            Text(
                                              "Age: 39",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "Midfielder",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 17,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "No: 69",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 17,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ))))))));
          }),
    );
  }
}
