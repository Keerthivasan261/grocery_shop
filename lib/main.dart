import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_shop/DrawerScreens/ShoppingLive.dart';
import 'package:grocery_shop/EndScreen.dart';
import 'package:grocery_shop/MainScreen.dart';
import 'package:grocery_shop/OrderScreen.dart';
import 'package:grocery_shop/ProductDescription.dart';
import 'package:grocery_shop/ProductScreen.dart';
import 'package:grocery_shop/RegistrationScreen.dart';
import 'package:grocery_shop/WelcomeScreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: _auth.currentUser!=null?'main':'welcome',
      routes: {
        'order':(context)=>OrderScreen(),
        'live':(context)=>ShoppingLive(),
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
