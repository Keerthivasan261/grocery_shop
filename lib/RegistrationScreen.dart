import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = "RegistrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email, check,check2, password = '', confirmpassword = '';
  final _auth = FirebaseAuth.instance;
  FocusNode myfocusnode2, myfocusnode3;
  bool checker = false, req = false,confirm=false;
  bool check1 = true;
  bool check3 = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticate1(password, confirmpassword);
    authenticate(password);
    myfocusnode2 = FocusNode();
    myfocusnode3 = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 200,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 120,
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage('images/trolley.png'),
                      ),
                    ),
                    TyperAnimatedTextKit(
                      displayFullTextOnTap: true,
                      speed: Duration(milliseconds: 100),
                      pause: Duration(seconds: 5),
                      text: ['U-Kart'],
                      textStyle: GoogleFonts.pacifico(
                          fontSize: 50,
                          fontWeight: FontWeight.w100,
                          color: Colors.green),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 8),
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(spreadRadius: 0.1,blurRadius: 5,offset: Offset(0.5,0.7),color: Colors.grey)],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              height: 50,
              width: 290,
              child: TextField(
                style: TextStyle(
                  fontSize: 17,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'UserName',
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
              ),
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(spreadRadius: 0.1,blurRadius: 5,offset: Offset(0.5,0.7),color: Colors.grey)],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              height: 50,
              width: 290,
              child: TextField(
                style: TextStyle(
                  fontSize: 17,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
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
              ),
            ),
            SizedBox(height: 15,),
            Builder(
              builder: (context) => Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(spreadRadius: 0.1,blurRadius: 5,offset: Offset(0.5,0.7),color: Colors.grey)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 50,
                width: 290,
                child: TextField(
                  onSubmitted: (input) {
                    if (email == null || !email.contains('@')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid email-ID'),
                        ),
                      );
                      checker = false;
                    } else {
                      checker = true;
                      myfocusnode2.requestFocus();
                    }
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
            SizedBox(height: 15,),
            Builder(
              builder: (context) => Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(spreadRadius: 0.1,blurRadius: 5,offset: Offset(0.5,0.7),color: Colors.grey)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 50,
                width: 290,
                child: TextField(
                  focusNode: myfocusnode2,
                  onSubmitted: (input) {
                    if (password == null || password.length <= 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid password'),
                        ),
                      );
                      checker = false;
                    } else {
                      checker = true;
                      myfocusnode3.requestFocus();
                    }
                  },
                  style: TextStyle(fontSize: 17, letterSpacing: 1),
                  obscureText: check1 == true ? true : false,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: check1 == true
                          ? Icon(MdiIcons.eyeOff)
                          : Icon(MdiIcons.eye),
                      onPressed: () {
                        setState(() {
                          check1 == true ? check1 = false : check1 = true;
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
                    if (password == null || password.length < 6) {
                      checker = false;
                    } else {
                      checker = true;
                    }
                      check = authenticate(password);
                    });
                  },
                ),
              ),
            ),
            req != true
                ? Text(
                    '$check',
                    style: TextStyle(
                        color: req != true ? Colors.red : Colors.white),
                  )
                : SizedBox(
                    height: 15,
                  ),
            Builder(
              builder: (context) => Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(spreadRadius: 0.1,blurRadius: 5,offset: Offset(0.5,0.7),color: Colors.grey)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 50,
                width: 290,
                child: TextField(
                  focusNode: myfocusnode3,
                  onSubmitted: (input) {
                    if (password != confirmpassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
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
                  obscureText: check3 == true ? true : false,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: check3 == true
                          ? Icon(MdiIcons.eyeOff)
                          : Icon(MdiIcons.eye),
                      onPressed: () {
                        setState(() {
                          check3 == true ? check3 = false : check3 = true;
                        });
                      },
                    ),
                    hintText: 'Confirm Password',
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
                    confirmpassword = value;
                    if (confirmpassword ==password) {
                      checker = true;
                    } else {
                      checker = false;
                    }
                      check2 = authenticate1(password,confirmpassword);
                    });
                  },
                ),
              ),
            ),
            check2==null?Text(
              '',
            ):Text(
                    '$check2',
                    style: TextStyle(
                        color: confirm != true ? Colors.red : Colors.white),
                  ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextButton(
                  onPressed: () async {
                    setState(
                      () {
                        if (password == null || email == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Invalid email-ID or password',
                              ),
                            ),
                          );
                        }
                      },
                    );
                    final user = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null && checker == true) {
                      print('logged in');
                      Navigator.pushReplacementNamed(
                          context, 'main');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Invalid email-ID or password',
                          ),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(spreadRadius: 0.3,blurRadius: 15,offset: Offset(1,3),color: Colors.grey)],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: RichText(
                text: TextSpan(
                    text: 'Old User? ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: 'Click here to Login',
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
      ),
    );
  }

  String authenticate(String pass) {
    if (pass == '' && pass == null) {
      req = false;
      return '';
    } else if (pass.length < 6 && pass.length != 0) {
      req = false;
      return '\'Password is weak\'';
    } else {
      req = true;
      return '';
    }
  }

  String authenticate1(String pass,String conf) {
    if (pass!=conf) {
      confirm = false;
      return '\'Password does not match\'';
    }else if(conf=='' || conf == null||pass=='' ||pass==null){
      confirm = false;
      return '';
    }
    else {
      confirm = true;
      return '';
    }
  }
}
