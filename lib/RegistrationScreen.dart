import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop/Constants.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email, check, password='';
  final auth = FirebaseAuth.instance;
  FocusNode myfocusnode2;
  bool checker = false, req = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticate(password);
    myfocusnode2 = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 8),
                child: Text(
                  'Register Account',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
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
                        myfocusnode2.requestFocus();
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
                  padding: EdgeInsets.fromLTRB(60, 5, 60, 5),
                  height: 60,
                  child: TextField(
                    focusNode: myfocusnode2,
                    onSubmitted: (input) {
                      if (password == null || password.length <= 4) {
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
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 15)),
                    onChanged: (value) {
                      password = value;
                      if (password == null || password.length < 6) {
                        checker = false;
                      } else {
                        checker = true;
                      }
                      setState(() {
                        check = authenticate(password);
                      });
                    },
                  ),
                ),
              ),
              Text('$check',style: TextStyle(color: req!=true?Colors.red:Colors.white),),
              Builder(
                builder: (context) => FlatButton(
                  onPressed: () async {
                    setState(
                      () {
                        if (password == null || email == null) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Invalid email-ID or password',
                              ),
                            ),
                          );
                        }
                      },
                    );
                    final user = await auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null && req==true) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'main', (route) => false);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
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
              ),
            ]),
      ),
    );
  }
  String authenticate(String pass) {
    if(pass=='' &&pass == null){
      req = false;
      return '';
    }
    else if(pass.length < 6 && pass.length!=0){
      req = false;
      return '\'Password is weak\'';
    }
    else{
      req = true;
      return '';
    }
  }
}
