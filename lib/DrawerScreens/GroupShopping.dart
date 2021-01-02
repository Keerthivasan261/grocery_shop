import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
          child: Center(
            child: Text(
              'Group Shopping',
              style: GoogleFonts.architectsDaughter(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.green),
            ),
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[500].withOpacity(0.4),
                    blurRadius: 5,
                    spreadRadius: 1)
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'use the generated link for Group shopping',
                hintStyle: TextStyle(fontSize: 17),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid, color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid, color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(width: 2, color: Colors.green)),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          alignment: Alignment.center,
          child: Text(
            'or',
            style: TextStyle(fontSize: 17),
          ),
        ),
        FlatButton(
            onPressed: () {},
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 40,
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
              child: Text('Generate Link',style: TextStyle(fontSize: 20,color: Colors.white),),
            ))
      ]),
    );
  }
}
