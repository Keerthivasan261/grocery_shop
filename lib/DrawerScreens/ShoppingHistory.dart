import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/DrawerScreens/Histories.dart';

class ShoppingHistory extends StatelessWidget {
  static const id = "ShoppingHistory";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),
          child: Center(
            child: Text(
              'History',
              style: GoogleFonts.architectsDaughter(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.green),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                  ),
                  child: Text(
                    'Recent Purchases',
                    style: TextStyle(fontSize: 16, color: Colors.green[800]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [BoxShadow(spreadRadius: 0.3,blurRadius: 7,color: Colors.grey)]
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ABC Super Market',
                                style: TextStyle(fontSize: 19),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Bangalore',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 16),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    text: 'No. of products purchased:',
                                    children: [
                                      TextSpan(
                                          text: ' 4',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,color: Colors.green[700],),)
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    text: 'Date:',
                                    children: [
                                      TextSpan(
                                          text: ' dd/mm/yyyy',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500))
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                      text: 'Bill Amount:',
                                      children: [
                                        TextSpan(
                                            text: ' ₹ xx',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500))
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
