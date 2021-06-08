import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grocery_shop/Constants.dart';
import 'package:grocery_shop/OrderScreen.dart';
import 'package:grocery_shop/TypeSelection.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

int price;
int mrpPrice;

class CartScreen extends StatefulWidget {
  static const id = "CartScreen";
  final product items;

  CartScreen({this.items});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int priceSum() {
    int sum1 = 0;
    for (int i = 0; i < cartitems.length; i++) {
      sum1 = sum1 + (cartitems[i].price * cartitems[i].requiredQuantity);
    }
    price = sum1;
    return sum1;
  }

  int mrpSum() {
    int sum2 = 0;
    for (int i = 0; i < cartitems.length; i++) {
      sum2 = sum2 + (cartitems[i].mrp * cartitems[i].requiredQuantity);
    }
    mrpPrice = sum2;
    return sum2;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    priceSum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.grey[800], fontSize: 23),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
        backgroundColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartitems.length,
              itemBuilder: (context, index) =>
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    secondaryActions: [
                      IconSlideAction(
                        color: Colors.red,
                        icon: MdiIcons.delete,
                        onTap: () {
                          setState(() {
                            widget.items.cartCheck = false;
                            cartitems.removeAt(index);
                          });
                        },
                      ),
                    ],
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: cartitems[index].color,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 5, right: 5),
                                    child: Image(
                                      image: AssetImage(cartitems[index].image),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10, left: 20),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 150,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      cartitems[index].title,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 23,
                                                          fontWeight: FontWeight.w700),
                                                    ),
                                                    Text(
                                                      (cartitems[index].quantity !=
                                                              null)
                                                          ? '${cartitems[index].quantity} ${cartitems[index].unit}'
                                                          : '${cartitems[index].unit}',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight: FontWeight.w400,
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(right: 20),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text:
                                                            '₹ ${cartitems[index].price}\n',
                                                        style: kTextStyle.copyWith(
                                                            fontSize: 22),
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                '₹ ${cartitems[index].mrp}',
                                                            style: TextStyle(
                                                                decoration: TextDecoration
                                                                    .lineThrough,
                                                                fontSize: 15,
                                                                color: Colors.green),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Row(children: [
                                                      Text(
                                                        'Pack of ${cartitems[index].requiredQuantity}',
                                                        style: TextStyle(color: Colors.green),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(
                                                        '₹${cartitems[index].price * cartitems[index].requiredQuantity}',
                                                        style: kTextStyle.copyWith(fontSize: 18),
                                                      ),
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                            ExpansionTile(title: Text("More details..",style:TextStyle(fontSize: 17,color: Colors.grey),),children: [
                              Row(
                                children: [
                                  Text("Qty: ",style:TextStyle(fontSize: 17,color: Colors.red),),
                                  IconButton(
                                      icon: Icon(
                                        MdiIcons.minusBox,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          cartitems[index].requiredQuantity > 1
                                              ? cartitems[index].requiredQuantity -= 1
                                              : null;
                                        });
                                      }),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.6),
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${cartitems[index].requiredQuantity}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        MdiIcons.plusBox,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          cartitems[index].requiredQuantity < 99
                                              ? cartitems[index].requiredQuantity += 1
                                              : null;
                                        });
                                      })
                                ],
                              ),
                            ],)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                )
              ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[600],
                    blurRadius: 15,
                    spreadRadius: 0.5,
                  ),
                ],
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height * 0.07,
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
                            text: '₹ ${priceSum()}  ',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 23),
                          ),
                          TextSpan(
                            text: (mrpSum() != 0) ? '₹ ${mrpSum()}' : '',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: RawMaterialButton(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        fillColor: Colors.green,
                        onPressed: () {
                          if (cartitems.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TypeSelection(
                                  mrpprice: mrpPrice,
                                  payableprice: price,
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 120,
                          child: Text(
                            'Place Order',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
