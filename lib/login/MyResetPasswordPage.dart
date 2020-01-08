import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_designs/login/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui_designs/login/login_screen.dart';


class MyResetPasswordPage extends StatefulWidget {
  MyResetPasswordPage({Key key}) : super(key: key);
 
  @override
  _MyResetPasswordPageState createState() => _MyResetPasswordPageState();
}
 
class _MyResetPasswordPageState extends State<MyResetPasswordPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
 
final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60.0,
          child: ClipOval(
            child: Image.asset(
              'assets/default.png',
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
          )),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        

        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            image:  DecorationImage(
                                image:  AssetImage("assets/ball3.jpg"),
                                fit: BoxFit.cover
                            )
                        )
                    ),

                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 30.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 50,),
                            Container(
                                height: 120,
                                width: 340,
                                decoration: BoxDecoration(
                                    image:  DecorationImage(
                                        image:  AssetImage(
                                            "assets/atro/logo.png"),
                                        fit: BoxFit.fitWidth
                                    )
                                )
                            ),


                            Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: Colors.white,
                                shadows: [
                                Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(5.0, 5.0),
                                 ),
                                ],
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 28.0),
                            logo,
                            SizedBox(height: 48.0),
                            buildTextFieldEmail(),
                            SizedBox(height: 2.0),
                            buildButtonSignUp(context),
                            SizedBox(height: 40.0),

                          ],
                        ),
                      ),
                    ),
              
                  ],
              ),
            ),
          ),
        ); 
  }
 
  Widget buildButtonSignUp(BuildContext context) {
    return InkWell(
        child: Container(
            constraints: BoxConstraints.expand(height: 42),
            child: Text("Reset password",
            
                textAlign: TextAlign.center,
                style: TextStyle(
            shadows: [
            Shadow(
            blurRadius: 5.0,
            color: Colors.black,
            offset: Offset(2.0, 2.0),
             ),
            ],
                  fontSize: 18, 
                  color: Colors.white)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[500]),
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(10)),
        onTap: () => resetPassword());
  }
 
  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(10)),
        child: TextField(
            controller: emailController,
            decoration: 
            InputDecoration.collapsed(hintText: "Email"),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 16)));
  }
 
 
  resetPassword() {
    String email = emailController.text.trim();
    _auth.sendPasswordResetEmail(email: email);
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("We send the detail to $email successfully.",
          style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.green[400],
    ));
  }
}






