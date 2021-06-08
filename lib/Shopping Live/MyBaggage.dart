import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyBaggage extends StatefulWidget {
  static const id = "MyBaggage";
  @override
  _MyBaggageState createState() => _MyBaggageState();
}

class _MyBaggageState extends State<MyBaggage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Baggage'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 10,
                color: Colors.grey[600].withOpacity(0.7))
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 20,
                    child: RichText(
                      text: TextSpan(
                        text: 'Baggage ID: ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: '106',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              subtitle: RichText(
                text: TextSpan(
                  text: 'Security Name:  ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Mr. xxxx',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Contact for queries',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              ),
              trailing: IconButton(icon: Icon(MdiIcons.phone,color: Colors.red,size: 28,),onPressed: (){
              },),
            )
          ],
        ),
      ),
    );
  }
}
