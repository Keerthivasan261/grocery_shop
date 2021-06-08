import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop/Business%20Login.dart';
import 'package:grocery_shop/Business/BusiProdDescAddProd.dart';
import 'package:grocery_shop/Business/BusiProducts.dart';
import 'package:grocery_shop/Business/EmployeeAudit.dart';
import 'package:grocery_shop/Business/OnboardEmployee.dart';
import 'package:grocery_shop/MainScreen.dart';
import 'package:grocery_shop/WelcomeScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BusiMainPage extends StatefulWidget {
  static const id = "BusiMainPage";
  final String storeName;

  BusiMainPage({this.storeName});

  @override
  _BusiMainPageState createState() => _BusiMainPageState();
}

class _BusiMainPageState extends State<BusiMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 250,
        color: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
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
              title: Text(widget.storeName),
              actions: [
                PopupMenuButton(
                  icon: Icon(MdiIcons.dotsVertical),
                  itemBuilder: (context) =>
                  [
                    PopupMenuItem(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Profile",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,WelcomeScreen.id,(routes)=>false);
                        },
                        child: Text(
                          "Sign Out",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          MainBlocks(
                            title: "Customer Insights",
                            subTitle:
                            "Explore information about your customer and sales",
                            onPressed: () {},
                          ),
                          MainBlocks(
                            title: "Offers & Giveaway",
                            subTitle:
                            "Modify & create offer and check offer insights",
                            onPressed: () {},
                          ),
                          MainBlocks(
                            title: "Employee Audit",
                            subTitle: "Click here look out employee live",
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => EmployeeAudit(storeName: widget.storeName,)));
                            },
                          ),
                          MainBlocks(
                            title: "Onboard Employees",
                            subTitle: "Click here to add / delete Employees",
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context) => OnboardEmployee(storeName: widget.storeName,)));
                            },
                          ),
                          MainBlocks(
                            title: "Add products",
                            subTitle: "Click here add / delete products",
                            onPressed: () {
                              Navigator.pushNamed(context, BusiProdAdd.id);
                            },
                          ),
                          MainBlocks(
                            title: "View / edit Product",
                            subTitle:
                            "Click here to view / edit existing product",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BusiProduct(
                                        storeName: widget.storeName,),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainBlocks extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onPressed;

  MainBlocks({@required this.title,
    @required this.subTitle,
    @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green[50],
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              subTitle,
            ),
          ),
        ),
      ),
    );
  }
}
