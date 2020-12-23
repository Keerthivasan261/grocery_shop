import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/CartScreen.dart';

class OrderScreen extends StatefulWidget {
  final int mrpprice;
  final int payableprice;

  OrderScreen({this.mrpprice, this.payableprice});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Payment'),
        elevation: 10,
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[700], spreadRadius: 0.5, blurRadius: 5)
                ]),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        child: Row(children: [
                          Text(
                            'PhonePe (UPI, Wallet)',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          )
                        ]),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[200],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        child: Row(children: [
                          Text(
                            'Credit/ Debit/ ATM card',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          )
                        ]),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[200],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        child: Row(children: [
                          Text(
                            'Net Banking',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          )
                        ]),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[200],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        child: Row(children: [
                          Text(
                            'Cash on Delivery',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[700], spreadRadius: 0.5, blurRadius: 5)
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'Price Details',
                        style: GoogleFonts.padauk(
                            fontSize: 17,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                widget.mrpprice != null
                                    ? '₹ ${widget.mrpprice}'
                                    : '₹ 0',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              )
                            ]),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[200],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amount payable',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                widget.payableprice != null
                                    ? '₹ ${widget.payableprice}'
                                    : '₹ 0',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[700],
                      spreadRadius: 0.5,
                      blurRadius: 5),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Price:  ',
                        style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                        children: [
                          TextSpan(
                            text: '₹ $price',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 23),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'Continue Shopping',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[500],
                            shadows: [
                              Shadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 4,
                                  offset: Offset(1, 2))
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
