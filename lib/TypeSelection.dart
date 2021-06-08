import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/BillScreen.dart';
import 'package:grocery_shop/CartScreen.dart';

class TypeSelection extends StatefulWidget {
  static const id = "TypeSelection";
  final int mrpprice;
  final int payableprice;

  TypeSelection({
    this.mrpprice,
    this.payableprice,
  });

  @override
  _TypeSelectionState createState() => _TypeSelectionState();
}

class _TypeSelectionState extends State<TypeSelection> {
  bool check1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.43,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/delivery.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.grey[700]),
                    actions: [],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.3,
                            blurRadius: 15,
                            color: Colors.grey[800])
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: Colors.white),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.57,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text(
                          "Door delivery",
                          style: TextStyle(fontSize: 18),
                        ),
                        leading: Checkbox(
                            value: check1,
                            activeColor: Colors.red,
                            onChanged: (check) {
                              setState(() {
                                check1 = check;
                              });
                            }),
                      ),
                      ListTile(
                        title: Text(
                          "In-Store Pickup",
                          style: TextStyle(fontSize: 18),
                        ),
                        leading: Checkbox(
                            value: !check1,
                            activeColor: Colors.red,
                            onChanged: (check) {
                              setState(() {
                                check1 = !check;
                              });
                            }),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 20,
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
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Discount',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 17,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    widget.mrpprice != null
                                        ? '-save ₹ ${widget.mrpprice - widget.payableprice}'
                                        : '₹ 0',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 20,
                                      color: Colors.red,
                                    ),
                                  )
                                ]),
                          ],
                        ),
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
                                style: GoogleFonts.courgette(
                                  fontSize: 25,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                widget.payableprice != null
                                    ? '₹ ${widget.payableprice}'
                                    : '₹ 0',
                                style: GoogleFonts.openSans(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, BillScreen.id);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        fillColor: Colors.red,
                        child: Container(
                            width: 150,
                            alignment: Alignment.center,
                            child: Text(
                              "Preview Bill",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 55,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      spreadRadius: 0.4, blurRadius: 10, color: Colors.grey)
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Continue Shopping",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'end');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      fillColor: Colors.green,
                      child: Container(
                        height: 45,
                        width: 120,
                        alignment: Alignment.center,
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
      onTap: () {},
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
