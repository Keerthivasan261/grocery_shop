import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/Business/BusiMainPage.dart';
import 'package:grocery_shop/Business/BusiPersonDetais.dart';
import 'package:grocery_shop/main.dart';

class BusinessLogin extends StatefulWidget {
  static const String id = "BusinessLogin";

  @override
  _BusinessLoginState createState() => _BusinessLoginState();
}

class _BusinessLoginState extends State<BusinessLogin> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: clipContainer(
                height: 350,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.green,
                    Colors.lightGreen[300],
                    Colors.lightGreen[50],
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Text(
                "Business Login",
                style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.grey[400],
                          blurRadius: 6,
                          offset: Offset(1.2, 1))
                    ],
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            KTextField(
              obscureText: false,
              keyboardType: TextInputType.phone,
              controller: phoneNumberController,
              hintText: "Mobile Number",
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  checkInfo(context);
                },
                child: Container(
                  width: 130,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Send OTP",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.2,
                        blurRadius: 8,
                        color: Colors.grey,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BusiPersonDetais.id);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Did\'nt have business account?",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: "Click Here!",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkInfo(BuildContext context) {
    if (phoneNumberController.text.length != 10) {
      displayToastMessage(context, "Mobile Number is not valid");
    } else {
      try {
        navigate();
      } catch (e) {
        displayToastMessage(context, "Store not found with the entered ph.no");
      }
    }
  }

  void navigate() {
    FirebaseList(
        query: userRef
            .child("Users")
            .child(phoneNumberController.text),
        onValue: (dataSnapshot) {
          String storeName = dataSnapshot.value["StoreName"];
          print(storeName);
          if (storeName.isNotEmpty && storeName != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BusiMainPage(
                  storeName: storeName,
                ),
              ),
            );
          }
        });
  }
}

class clipContainer extends StatelessWidget {
  final double height;
  final LinearGradient gradient;

  clipContainer({this.height, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 5, spreadRadius: 5, color: Colors.black),
      ], gradient: gradient),
      width: MediaQuery.of(context).size.width,
    );
  }
}

displayToastMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

class KTextField extends StatelessWidget {
  final bool obscureText;
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;

  KTextField(
      {this.obscureText, this.keyboardType, this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(1, 3))
            ]),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 3.5, color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
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
