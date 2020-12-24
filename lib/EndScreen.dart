import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EndScreen extends StatefulWidget {
  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {

  bool select = false;
  bool wait =false;

  Future delay() async{
    await new Future.delayed(Duration(milliseconds: 2100),(){
      setState(() {
        select = true;
      });
    });
  }

  Future delay1() async{
    await new Future.delayed(Duration(milliseconds: 2000),(){
      setState(() {
        wait = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delay();
    delay1();
  }

  @override
  Widget build(BuildContext context) {
    return wait ? Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                  height: select?200:1,
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(spreadRadius: 1,blurRadius: 15,color: Colors.green.withOpacity(0.5))],
                     borderRadius: BorderRadius.circular(200)),
                  child: Image(
                    image: AssetImage('images/tick_gif.gif'),
                    colorBlendMode: BlendMode.darken,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Thanks for Shopping',
                style: GoogleFonts.courgette(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5),
              )
            ]),
      ),
    ) : Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitFadingCircle(
            color: Colors.green,
            size: 70,
          ),
          SizedBox(height: 20,),
          Text('Payment pending ..',style: GoogleFonts.sourceSansPro(fontSize: 22,fontWeight: FontWeight.w600),)
        ],
      )),
    );
  }
}


