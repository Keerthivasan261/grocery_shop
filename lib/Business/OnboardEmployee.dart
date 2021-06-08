import 'package:flutter/material.dart';
import 'package:grocery_shop/Business%20Login.dart';
import 'package:grocery_shop/main.dart';

class OnboardEmployee extends StatefulWidget {
  static const id = "OnboardEmployee";
  final String storeName;
  OnboardEmployee({this.storeName});

  @override
  _OnboardEmployeeState createState() => _OnboardEmployeeState();
}

class _OnboardEmployeeState extends State<OnboardEmployee> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  String rank;
  String dropDownValue = "Token Manager";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        ClipPath(
            clipper: MyClipper(),
            child: clipContainer(
              height: 300,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green,
                  Colors.lightGreen[300],
                ],
              ),
            )),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 130, 20, 20),
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
              borderRadius: BorderRadius.circular(10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 10),
                        child: Text(
                          "Onboard an Employee",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Name",
                        keyboardType: TextInputType.name,
                        controller: nameController,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Mobile Number",
                        keyboardType: TextInputType.phone,
                        controller: mobileNumberController,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "email-Id",
                        keyboardType: TextInputType.emailAddress,
                        controller: emailIdController,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Address(Door No.)",
                        keyboardType: TextInputType.text,
                        controller: addressController,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "Street Name",
                        keyboardType: TextInputType.text,
                        controller: streetController,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "City",
                        keyboardType: TextInputType.text,
                        controller: cityController,
                      ),
                      KTextField(
                        obscureText: false,
                        hintText: "PinCode",
                        keyboardType: TextInputType.number,
                        controller: pinCodeController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: DropdownButton(
                          value: dropDownValue,
                          onChanged: (String value) {
                            setState(() {
                              dropDownValue = value;
                            });
                          },
                          items: <String>["Manager","Store Incharge", "Sales Executive", "Token Manager"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: RawMaterialButton(
                          onPressed: () {
                            checkDetails();
                          },
                          child: Text(
                            "Onboard",
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fillColor: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ])),
    );
  }
  void checkDetails(){
    if(nameController.text.isEmpty){
      displayToastMessage(context, "Enter Name of the employee");
    }
    else if(mobileNumberController.text.isEmpty){
      displayToastMessage(context, "Enter Mobile Number of the employee");
    }
    else if(emailIdController.text.isEmpty){
      displayToastMessage(context, "Enter Email-Id of the employee");
    }
    else if(addressController.text.isEmpty){
      displayToastMessage(context, "Enter Address of the employee");
    }
    else if(streetController.text.isEmpty){
      displayToastMessage(context, "Enter Street name of the employee");
    }
    else if(cityController.text.isEmpty){
      displayToastMessage(context, "Enter City name of the employee");
    }
    else if(pinCodeController.text.isEmpty){
      displayToastMessage(context, "Enter PinCode of the employee");
    }else{
      if(dropDownValue=="Manager"){
        rank = "1";
      }else if(dropDownValue=="Store Incharge"){
        rank = "2";
      }
      else if(dropDownValue=="Sales Executive"){
        rank = "3";
      }
      else if(dropDownValue=="Token Manager"){
        rank = "4";
      }
      Map userData = {
        "ProprietorName": nameController.text,
        "MobileNumber": mobileNumberController.text,
        "Email-Id": emailIdController.text,
        "Address": addressController.text,
        "StreetName": streetController.text,
        "City": cityController.text,
        "Position": dropDownValue,
        "Order": rank,
        "PinCode": pinCodeController.text,
      };
      var check = userRef.child(widget.storeName).child("Users").child(nameController.text).set(userData).asStream();
      if(check!=null){
        displayToastMessage(context, "Details successfully added");
        nameController.clear();
        mobileNumberController.clear();
        emailIdController.clear();
        addressController.clear();
        streetController.clear();
        cityController.clear();
        pinCodeController.clear();
      }
    }
  }
}
