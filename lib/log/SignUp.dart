import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _name, _email, _password;

  checkAuthincation() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  navigateToSignInScreen() {
    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthincation();
  }

  signup() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      try {
        AuthResult user = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (user != null) {
          UserUpdateInfo userUpdateInfo = UserUpdateInfo();
          userUpdateInfo.displayName = _name;
          user.user.updateProfile(userUpdateInfo);
        }
      } catch (e) {
        showError(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/ball3.jpg"),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black54,
          ),
          Theme(
              data: ThemeData(
                  brightness: Brightness.dark,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle:
                        TextStyle(color: Colors.tealAccent, fontSize: 25.0),
                  )),
              isMaterialAppTheme: true,
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 90.0,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                  tag: "KickIt",
                  child:  Container(
                    width: 280,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/atro/logo.png"),
                            fit: BoxFit.fitWidth)))),
                        SizedBox(height: 65),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
//                        Name box
                              Container(
                                child: TextFormField(
                                  maxLength: 10,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Provide an name';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      contentPadding: EdgeInsets.all(15),
                                      suffixIcon: Icon(
                                        Icons.account_circle,
                                        color: Colors.white,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white38,
                                      focusColor: Colors.white38,
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
                                      hintText: 'Name'),
                                  onSaved: (input) => _name = input,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                              ),
//                      email
                              Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Provide an email';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      contentPadding: EdgeInsets.all(15),
                                      suffixIcon: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white38,
                                      focusColor: Colors.white38,
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
                                      hintText: 'E-mail'),
                                  onSaved: (input) => _email = input,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  validator: (input) {
                                    if (input.length < 6) {
                                      return 'Password must be atleast 6 char long';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      contentPadding: EdgeInsets.all(15),
                                      suffixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white38,
                                      focusColor: Colors.white38,
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
                                      hintText: 'Passwod'),
                                  onSaved: (input) => _password = input,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 60),
                              ),
                              RaisedButton(
                                  padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                                  color: Colors.lightBlueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(4),
                                  ),
                                  onPressed: signup,
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(shadows: [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.black,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ], color: Colors.white, fontSize: 20),
                                  )),
//                      redirect to signup page
                              Padding(
                                padding: EdgeInsets.all(12),
                              ),
                              GestureDetector(
                                onTap: navigateToSignInScreen,
                                child: Text(
                                  'Already have an account? click here',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        blurRadius: 7.0,
                                        color: Colors.black,
                                        offset: Offset(3.0, 3.0),
                                      ),
                                    ],
                                    fontSize: 16.0,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ])))
        ],
      ),
    );
  }
}
