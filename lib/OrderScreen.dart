import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/BillScreen.dart';
import 'package:grocery_shop/CartScreen.dart';

class OrderScreen extends StatefulWidget {
  static const id = "OrderScreen";
  final int mrpprice;
  final int payableprice;

  OrderScreen({this.mrpprice, this.payableprice,});

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
        backgroundColor: Colors.green,
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
                    gesturedetector(
                      text: 'PhonePe (UPI, Wallet)',
                    ),
                    divider(),
                    gesturedetector(
                      text: 'Credit/ Debit/ ATM card',
                    ),
                    divider(),
                    gesturedetector(
                      text: 'Net Banking',
                    ),
                    divider(),
                    gesturedetector(
                      text: 'Cash on Delivery',
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
                    Container(
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
                    Divider(
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                      color: Colors.grey[300],
                    ),
                    Container(
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
                                color: Colors.green,
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
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BillScreen(),
                  ),
                );
              },
              child: Text(
                'Click here for Bill !!',
                style: TextStyle(
                    fontSize: 20, letterSpacing: 1.5, color: Colors.red[600]),
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
                          'Cancel Order',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.green[600],
                            shadows: [
                              Shadow(
                                  color: Colors.green.withOpacity(0.4),
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

class divider extends StatelessWidget {
  const divider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: Colors.grey[200],
    );
  }
}

class gesturedetector extends StatelessWidget {
  final String text;

  gesturedetector({
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, 'end', (route) => false);
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Text(
            text,
            style: GoogleFonts.sourceSansPro(
              fontSize: 20,
              color: Colors.black,
            ),
          )
        ]),
      ),
    );
  }
}
