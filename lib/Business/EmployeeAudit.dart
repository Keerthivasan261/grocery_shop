import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop/Business%20Login.dart';
import 'package:grocery_shop/main.dart';

class EmployeeAudit extends StatefulWidget {
  final String storeName;

  EmployeeAudit({this.storeName});

  @override
  _EmployeeAuditState createState() => _EmployeeAuditState();
}

class _EmployeeAuditState extends State<EmployeeAudit> {
  final users = userRef;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  String rank;
  String dropDownValue = "Worker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
            title: Text(
              widget.storeName + "\'s Worker details",
              style: TextStyle(fontSize: 23),
            ),
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
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: FirebaseAnimatedList(
                          physics: BouncingScrollPhysics(),
                          query: users.child(widget.storeName).child("Users"),
                          sort: (a, b) {
                            return a.value["Order"]
                                .toString()
                                .compareTo(b.value["Order"].toString());
                          },
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context,
                              DataSnapshot snapshot,
                              Animation<double> animation,
                              int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 15),
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 17,horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.lightGreen[50]),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Name: ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.w500)),
                                      TextSpan(
                                          text:
                                              "${snapshot.value["ProprietorName"]}\n",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: "MobileNumber: ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.w500)),
                                      TextSpan(
                                          text:
                                              "${snapshot.value["MobileNumber"]}\n",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 15,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.w500)),
                                      TextSpan(
                                          text: "Email-Id: ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.w500)),
                                      TextSpan(
                                          text:
                                              "${snapshot.value["Email-Id"]}\n",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 15,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.w500)),
                                      TextSpan(
                                          text: "Designation: ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.w500)),
                                      TextSpan(
                                          text: "${snapshot.value["Position"]}",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 17,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.w700))
                                    ]),
                                  )),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
