import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Field

  // Method
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<void> startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, authenProcess);
  }

  void authenProcess() {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen());
    Navigator.of(context)
        .pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route) => false);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/KickItAppss');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ball4.jpg"),
                        fit: BoxFit.cover))),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 30.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 80),
                    Container(
                        child: Text("Welcome to",
                            style: TextStyle(
                              fontSize: 35.0,
                              fontFamily: 'Montserrat',
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.black,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                              color: Colors.white,
                            ))),
                    SizedBox(height: 30),
                    Container(
                        child: Text("Soccer community",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Montserrat',
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.black,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                              color: Colors.white,
                            ))),
                    SizedBox(height: 80),
                    Container(
                        height: 140,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/atro/logo.png"),
                                fit: BoxFit.fitWidth))),
                    SizedBox(height: 250),
                    Container(
                        child:
                            Text("Copyright © 2019 KickIt, all rights reserved",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Montserrat',
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.black,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                  color: Colors.white,
                                ))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
