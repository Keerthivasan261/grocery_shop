import 'package:flutter/material.dart';
import 'package:grocery_shop/Business%20Login.dart';
import 'package:grocery_shop/Business/BusiStoreDetails.dart';
import 'package:grocery_shop/main.dart';

class BusiPersonDetais extends StatefulWidget {
  static const id = "BusiPersonDetais";

  @override
  _BusiPersonDetaisState createState() => _BusiPersonDetaisState();
}

class _BusiPersonDetaisState extends State<BusiPersonDetais> {
  TextEditingController storeNameContr = new TextEditingController();
  TextEditingController proprietorNameContr = new TextEditingController();
  TextEditingController mobileNumberContr = new TextEditingController();
  TextEditingController emailIdContr = new TextEditingController();
  TextEditingController addressContr = new TextEditingController();
  TextEditingController streetNameContr = new TextEditingController();
  TextEditingController cityNameContr = new TextEditingController();
  TextEditingController pinCodeContr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
                clipper: MyClipper(),
                child: clipContainer(
                  height: 250,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.green,
                      Colors.lightGreen[300],
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0.5,
                      blurRadius: 7,
                      color: Colors.grey,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 20),
                        child: SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            "Proprietor Details",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 23),
                          )),
                        ),
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Store Name",
                        keyboardType: TextInputType.name,
                        controller: storeNameContr,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Proprietor Name",
                        keyboardType: TextInputType.name,
                        controller: proprietorNameContr,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Mobile Number",
                        keyboardType: TextInputType.number,
                        controller: mobileNumberContr,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "email Id",
                        keyboardType: TextInputType.emailAddress,
                        controller: emailIdContr,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Address (Door No.)",
                        keyboardType: TextInputType.streetAddress,
                        controller: addressContr,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Street Name",
                        keyboardType: TextInputType.streetAddress,
                        controller: streetNameContr,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "City",
                        keyboardType: TextInputType.text,
                        controller: cityNameContr,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Pincode",
                        keyboardType: TextInputType.number,
                        controller: pinCodeContr,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 5,
                          left: MediaQuery.of(context).size.width * 0.3,
                          right: MediaQuery.of(context).size.width * 0.3,
                          bottom: 20,
                        ),
                        child: RawMaterialButton(
                          onPressed: () {
                            checkInfo();
                          },
                          child: Text("Next"),
                          fillColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkInfo() {
    if (storeNameContr.text.isEmpty) {
      displayToastMessage(context, "Enter the Store Name");
    } else if (proprietorNameContr.text.isEmpty) {
      displayToastMessage(context, "Enter the proprietor Name");
    } else if (mobileNumberContr.text.length < 10) {
      displayToastMessage(context, "Enter the Valid Mobile number");
    } else if (emailIdContr.text.isEmpty || !emailIdContr.text.contains("@")) {
      displayToastMessage(context, "Enter the valid email-Id");
    } else if (addressContr.text.isEmpty) {
      displayToastMessage(context, "Enter the valid Address");
    } else if (streetNameContr.text.isEmpty) {
      displayToastMessage(context, "Enter the street name");
    } else if (cityNameContr.text.isEmpty) {
      displayToastMessage(context, "Enter the city name");
    } else if (pinCodeContr.text.isEmpty) {
      displayToastMessage(context, "Enter the pincode");
    } else {
      addData();
    }
  }

  void addData() {
    Map userData = {
      "ProprietorName": proprietorNameContr.text,
      "MobileNumber": mobileNumberContr.text,
      "Email-Id": emailIdContr.text,
      "Address": addressContr.text,
      "StreetName": streetNameContr.text,
      "City": cityNameContr.text,
      "Position": "Owner",
      "Order": "0",
      "PinCode": pinCodeContr.text,
    };
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BusiStoreDetails(
                  storeName: storeNameContr.text,
              userData: userData,
                )));
  }
}
