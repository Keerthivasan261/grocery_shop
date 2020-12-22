import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop/LoginScreen.dart';
import 'package:grocery_shop/ProductDescription.dart';
import 'package:grocery_shop/RegistrationScreen.dart';
import 'package:grocery_shop/WelcomeScreen.dart';
import 'package:grocery_shop/MainScreen.dart';
import 'package:grocery_shop/ProductScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome',
      routes: {
        'desc':(context) => ProductDescription(),
        'product':(context) => ProductScreen(),
        'welcome':(context)=> WelcomeScreen(),
        'login':(context)=> LoginScreen(),
        'register':(context)=> RegistrationScreen(),
        'main':(context)=> MainScreen(),
      },
    );
  }
}
