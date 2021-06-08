import 'package:flutter/material.dart';
import 'package:grocery_shop/Business%20Login.dart';
import 'package:grocery_shop/Business/BusiMainPage.dart';
import 'package:grocery_shop/main.dart';

class BusiStoreDetails extends StatefulWidget {
  static const id = "BusiStoreDetails";

  final Map userData;
  final String proprietorName;
  final String storeName;

  BusiStoreDetails({this.storeName, this.userData, this.proprietorName});

  @override
  _BusiStoreDetailsState createState() => _BusiStoreDetailsState();
}

class _BusiStoreDetailsState extends State<BusiStoreDetails> {
  TextEditingController GST_TIN_noContr = new TextEditingController();
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
                            "Shop Details",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 23),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 20),
                        child: Text(
                          widget.storeName,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 23),
                        ),
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "GST TIN no.",
                        keyboardType: TextInputType.number,
                        controller: GST_TIN_noContr,
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
    if (GST_TIN_noContr.text.isEmpty) {
      displayToastMessage(context, "Enter the GST TIN no");
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
      "GST_TIN_no": GST_TIN_noContr.text,
      "MobileNumber": mobileNumberContr.text,
      "Email-Id": emailIdContr.text,
      "Address": addressContr.text,
      "StreetName": streetNameContr.text,
      "City": cityNameContr.text,
      "PinCode": pinCodeContr.text,
    };

    userRef
        .child(widget.storeName)
        .child("Users")
        .child(widget.proprietorName)
        .set(widget.userData)
        .asStream();
    userRef
        .child(widget.storeName)
        .child("StoreDetails")
        .set(userData)
        .asStream();
    Navigator.pushNamed(context, BusiMainPage.id);
    displayToastMessage(context, "\'Store details added successfully\'");
  }
}
