import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop/EndScreen.dart';
import 'package:grocery_shop/MainScreen.dart';
import 'package:grocery_shop/OrderScreen.dart';
import 'package:grocery_shop/ProductDescription.dart';
import 'package:grocery_shop/ProductScreen.dart';
import 'package:grocery_shop/RegistrationScreen.dart';
import 'package:grocery_shop/WelcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static var visitedEmail ;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    try {
      final SharedPreferences preferences = await SharedPreferences
          .getInstance();
      MyApp.visitedEmail = preferences.getString('email');
    }
    catch(e){
      Navigator.pushReplacementNamed(context, 'welcome');
    }
  }
  @override
  Widget build(BuildContext context) {

    Future checkemail() async{
      try {
        final SharedPreferences preferences = await SharedPreferences
            .getInstance();
        MyApp.visitedEmail = preferences.getString('email');
      }
      catch(e){
        Navigator.pushReplacementNamed(context, 'welcome');
      }
    };

    String mainpage() {
      try{
        if(MyApp.visitedEmail==null){
          return 'welcome';
        }
        else {
          return 'main';
        }
      }
      catch(e){
        return 'welcome';
      }
    }

    checkemail();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: mainpage(),
      routes: {
        'order':(context)=>OrderScreen(),
        'end':(context)=>EndScreen(),
        'desc':(context) => ProductDescription(),
        'product':(context) => ProductScreen(),
        'welcome':(context)=> WelcomeScreen(),
        'register':(context)=> RegistrationScreen(),
        'main':(context)=> MainScreen(),
      },
    );
  }
}
