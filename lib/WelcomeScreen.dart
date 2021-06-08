import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:grocery_shop/Business%20Login.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "WelcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool check = true, check1 = false;
  String email, password;
  bool checker = false;
  FocusNode myfocusnode1, myfocusnode2;
  final auth = FirebaseAuth.instance;

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
        child: Stack(
          children: [
            Container(
              child: Column(children: [
                ClipPath(
                  clipper: kMyClipper(),
                  child: Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.5,
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(10, 10))
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Colors.green[700],
                            Colors.green,
                            Colors.lightGreenAccent,
                            Colors.lightGreen[100]
                          ]),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('images/trolley.png'),
                            ),
                          ),
                          Text(
                            "U-KART",
                            style: GoogleFonts.pacifico(
                                fontSize: 35,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ]),
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
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.1,
                            blurRadius: 5,
                            offset: Offset(0.5, 0.7),
                            color: Colors.grey)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: 50,
                    width: 300,
                    child: TextField(
                      onSubmitted: (input) {
                        setState(() {
                          if (email == null || !email.contains('@')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Invalid email-ID'),
                              ),
                            );
                            checker = false;
                          } else {
                            check1 = false;
                            checker = true;
                            myfocusnode1.requestFocus();
                          }
                        });
                      },
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email-ID',
                        hintStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Colors.greenAccent[700], width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Colors.greenAccent[700], width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Colors.greenAccent[700], width: 2.5),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                          if (email == null || !email.contains('@')) {
                            checker = false;
                          } else {
                            check1 = false;
                            checker = true;
                          }
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                check1 == true
                    ? Text(
                        '\'Enter your Email-ID\'',
                        style: TextStyle(color: Colors.red),
                      )
                    : SizedBox(
                        height: 1,
                      ),
                Builder(
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.1,
                            blurRadius: 5,
                            offset: Offset(0.5, 0.7),
                            color: Colors.grey)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: 50,
                    width: 300,
                    child: TextField(
                      focusNode: myfocusnode1,
                      onSubmitted: (input) {
                        setState(() {
                          if (password == null || password.length < 5) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Invalid password'),
                              ),
                            );
                            checker = false;
                          } else {
                            checker = true;
                          }
                        });
                      },
                      style: TextStyle(fontSize: 17, letterSpacing: 1),
                      obscureText: check == true ? true : false,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: check == true
                              ? Icon(MdiIcons.eyeOff)
                              : Icon(MdiIcons.eye),
                          onPressed: () {
                            setState(() {
                              check == true ? check = false : check = true;
                            });
                          },
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Colors.greenAccent[700], width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Colors.greenAccent[700], width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Colors.greenAccent[700], width: 2.5),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                          if (password == null || password.length <= 3) {
                            checker = false;
                          } else {
                            checker = true;
                          }
                        });
                      },
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    'Forget password',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        color: Colors.blue),
                  ),
                  onPressed: () {
                    setState(() {
                      email != null
                          ? auth.sendPasswordResetEmail(email: email)
                          : check1 = true;
                    });
                  },
                ),
                Builder(
                  builder: (context) => TextButton(
                    onPressed: () async {
                      try {
                        final user = await auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        print(user);
                        if (user != null && checker == true) {
                          print('logged in');
                          Navigator.pushReplacementNamed(context, 'main');
                        }
                      } catch (e) {
                        print(e);
                      }
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
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.3,
                                blurRadius: 15,
                                offset: Offset(1, 3),
                                color: Colors.grey)
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  child: Text(
                    'or',
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'New User? ',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: 'Click here to sign up',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue),
                          )
                        ]),
                  ),
                ),
              ]),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: SizedBox(
                  width: 0,
                ),
                actions: [
                  PopupMenuButton(
                      icon: Icon(
                        MdiIcons.dotsVertical,
                        color: Colors.black,
                      ),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: TextButton(child: Container(
                                  child: Text("Business Login"),),onPressed: (){
                                Navigator.pushNamed(context, BusinessLogin.id);
                              },),
                            )
                          ]),
                  SizedBox(width: 10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class kMyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(size.width / 4, size.height + 10,
        size.width - (size.width / 3), size.height - 40);
    path.quadraticBezierTo(size.width - (size.width / 7), size.height - 50,
        size.width, size.height - 20);
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
