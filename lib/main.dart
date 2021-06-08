import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_shop/BillScreen.dart';
import 'package:grocery_shop/Business%20Login.dart';
import 'package:grocery_shop/Business/BusiMainPage.dart';
import 'package:grocery_shop/Business/BusiPersonDetais.dart';
import 'package:grocery_shop/Business/BusiProdDesc.dart';
import 'package:grocery_shop/Business/BusiProdDescAddProd.dart';
import 'package:grocery_shop/Business/BusiStoreDetails.dart';
import 'package:grocery_shop/Business/OnboardEmployee.dart';
import 'package:grocery_shop/DrawerScreens/ShoppingLive.dart';
import 'package:grocery_shop/EndScreen.dart';
import 'package:grocery_shop/MainScreen.dart';
import 'package:grocery_shop/OrderScreen.dart';
import 'package:grocery_shop/ProductDescription.dart';
import 'package:grocery_shop/ProductScreen.dart';
import 'package:grocery_shop/RegistrationScreen.dart';
import 'package:grocery_shop/Validate.dart';
import 'package:grocery_shop/WelcomeScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("BusinessUsers");
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return ChangeNotifierProvider(
      create: (context) => Validate(),
      child: Consumer<Validate>(
        builder: (context, validate, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: _auth.currentUser != null ? 'main' : 'welcome',
          routes: {
            BusiProdDesc.id:(context)=>BusiProdDesc(),
            OnboardEmployee.id:(context)=>OnboardEmployee(),
            BusiProdAdd.id:(context)=>BusiProdAdd(),
            BusiMainPage.id:(context) => BusiMainPage(),
            BusiStoreDetails.id:(context)=> BusiStoreDetails(),
            BillScreen.id: (context) => BillScreen(),
            WelcomeScreen.id:(context)=>WelcomeScreen(),
            BusinessLogin.id:(context)=>BusinessLogin(),
            BusiPersonDetais.id:(context)=>BusiPersonDetais(),
            'order': (context) => OrderScreen(),
            'live': (context) => ShoppingLive(),
            'end': (context) => EndScreen(),
            'desc': (context) => ProductDescription(),
            'product': (context) => ProductScreen(),
            'welcome': (context) => WelcomeScreen(),
            'register': (context) => RegistrationScreen(),
            'main': (context) => MainScreen(),
          },
        ),
      ),
    );
  }
}
