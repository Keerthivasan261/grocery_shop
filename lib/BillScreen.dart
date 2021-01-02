import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/Constants.dart';
import 'package:grocery_shop/MainScreen.dart';

class BillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 70, 10, 20),
        child: Container(
          padding: EdgeInsets.only(bottom: 30,left: 5,right: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Center(
                child: Text(
                  storename.title,
                  style: GoogleFonts.cagliostro(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      letterSpacing: 1.5),
                ),
              ),
              Center(
                child: Text(
                  '${storename.address}, India',
                  style: GoogleFonts.cagliostro(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                      fontSize: 18,
                      letterSpacing: 1.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date:',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Text(
                      ' dd/mm/yyyy',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.black,
                indent: 10,
                endIndent: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 40,
                    color: Colors.lightGreenAccent[100],
                    child: Text(
                      'S No',
                      style: GoogleFonts.cagliostro(fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        color: Colors.lightGreenAccent[100],
                        child: Text(
                          'Product Name',
                          style: GoogleFonts.cagliostro(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 40,
                    color: Colors.lightGreenAccent[100],
                    child: Text(
                      'Qt',
                      style: GoogleFonts.cagliostro(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 80,
                      color: Colors.lightGreenAccent[100],
                      child: Text(
                        'price',
                        style: GoogleFonts.cagliostro(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height,
                    width: 40,
                    color: Colors.lightGreen[50],
                    child: ListView.builder(
                      itemCount: cartitems.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text('${index + 1}'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.lightGreen[50],
                        child: ListView.builder(
                          itemCount: cartitems.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text('${cartitems[index].title}'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height,
                    width: 40,
                    color: Colors.lightGreen[50],
                    child: ListView.builder(
                      itemCount: cartitems.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text('${cartitems[index].requiredQuantity}'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      width: 80,
                      color: Colors.lightGreen[50],
                      child: ListView.builder(
                        itemCount: cartitems.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text('${cartitems[index].price*cartitems[index].requiredQuantity}'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    leading: Text('Price: ',style: TextStyle(fontSize: 17),),
                    trailing: Text('${priceSum()}',style: TextStyle(fontSize: 20),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

int priceSum() {
  int sum1 = 0;
  for (int i = 0; i < cartitems.length; i++) {
    sum1 = sum1 + (cartitems[i].price * cartitems[i].requiredQuantity);
  }
  return sum1;
}