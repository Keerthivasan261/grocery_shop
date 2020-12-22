import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/Constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String email;
  String password;
  String Error = null;
  bool ShowSpinner = false;
  var user = null;
  bool checker = false,req=false;
  final auth = FirebaseAuth.instance;
  FocusNode myfocusnode1, myfocusnode2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myfocusnode1 = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ClipPath(
            clipper: Myclipper(),
            child: Container(
              height: 350,
              color: Colors.cyan,
              child: Center(
                  child: TyperAnimatedTextKit(
                speed: Duration(milliseconds: 100),
                pause: Duration(seconds: 3),
                text: ['Grocery Shop'],
                textStyle: GoogleFonts.pacifico(
                    fontSize: 50,
                    fontWeight: FontWeight.w100,
                    color: Colors.white),
              )),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 30, bottom: 8),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          //SizedBox(height: 10),
          Builder(
            builder: (context) => Container(
              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
              height: 70,
              child: TextField(
                onSubmitted: (input) {
                  print(input);
                  if (email == null || !email.contains('@')) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid email-ID'),
                      ),
                    );
                    checker = false;
                  } else {
                    checker = true;
                    myfocusnode1.requestFocus();
                  }
                },
                style: TextStyle(
                  fontSize: 17,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: kDecor.copyWith(
                  hintText: 'Email-ID',
                  hintStyle: TextStyle(fontSize: 15),
                ),
                onChanged: (value) {
                  email = value;
                  if (email == null || !email.contains('@')) {
                    checker = false;
                  } else {
                    checker = true;
                  }
                },
              ),
            ),
          ),
          Builder(
            builder: (context) => Container(
              padding: EdgeInsets.fromLTRB(60, 5, 60, 15),
              height: 70,
              child: TextField(
                focusNode: myfocusnode1,
                onSubmitted: (input) {
                  if (password == null || password.length < 6) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid password'),
                      ),
                    );
                    checker = false;
                  } else {
                    checker = true;
                  }
                },
                style: TextStyle(fontSize: 17, letterSpacing: 1),
                obscureText: true,
                obscuringCharacter: '*',
                decoration: kDecor.copyWith(
                    hintText: 'Password', hintStyle: TextStyle(fontSize: 15)),
                onChanged: (value) {
                  password = value;
                  if (password == null || password.length <= 6) {
                    checker = false;
                  } else {
                    checker = true;
                  }
                },
              ),
            ),
          ),
          //error(),
          Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                user = await auth.signInWithEmailAndPassword(
                    email: this.email, password: this.password);
                setState(() {
                  try {
                    if (user != null && checker == true) {
                      print(user);
                      req=true;
                      Navigator.pushNamedAndRemoveUntil(context, 'main',(route) => false);
                    }
                    if(req==false){
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid email-ID or password'),
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                });
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      Colors.greenAccent[400],
                      Colors.tealAccent[400],
                      Colors.cyan[400],
                      Colors.blue
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13),
            child: Text(
              'or',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, 'register');
            },
            child: Text(
              'Create Account?',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 2, size.height + 20, size.width, size.height - 70);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
