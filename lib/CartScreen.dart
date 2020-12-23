import 'package:flutter/material.dart';
import 'package:grocery_shop/Constants.dart';
import 'package:grocery_shop/OrderScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

int price;
int mrpPrice;

class CartScreen extends StatefulWidget {
  product items;

  CartScreen({this.items});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Container(
                    height: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: cartitems[index].color,
                          ),
                          width: 120,
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
                                      Column(
                                        children: [
                                          Text(
                                            cartitems[index].title,
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            (cartitems[index].quantity != null)
                                                ? '${cartitems[index].quantity} ${cartitems[index].unit}'
                                                : '${cartitems[index].unit}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
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
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Quantity',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: IconButton(
                                                    icon: Icon(
                                                      MdiIcons.minusBox,
                                                      size: 35,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        cartitems[index]
                                                                    .requiredQuantity >
                                                                1
                                                            ? cartitems[index]
                                                                .requiredQuantity -= 1
                                                            : null;
                                                      });
                                                    }),
                                              ),
                                              SizedBox(width: 5),
                                              Flexible(
                                                child: Container(
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        spreadRadius: 1,
                                                        blurRadius: 10,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                      )
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${cartitems[index].requiredQuantity}',
                                                      style: TextStyle(
                                                          fontSize: 23,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: IconButton(
                                                    icon: Icon(
                                                      MdiIcons.plusBox,
                                                      size: 35,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        cartitems[index]
                                                                    .requiredQuantity <
                                                                99
                                                            ? cartitems[index]
                                                                .requiredQuantity += 1
                                                            : null;
                                                      });
                                                    }),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 15,left: 20),
                                      child: Column(children: [
                                        Text(
                                          'Pack of ${cartitems[index].requiredQuantity}',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        Text(
                                          '₹${cartitems[index].price * cartitems[index].requiredQuantity}',
                                          style:
                                              kTextStyle.copyWith(fontSize: 18),
                                        ),
                                      ]),
                                    )
                                  ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      widget.items.cartCheck = false;
                      cartitems.remove(cartitems[index]);
                    });
                  },
                  child: Center(
                      child: Text(
                    'Remove',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  )),
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
                            text: '₹ ${priceSum()}',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 23),
                          ),
                          TextSpan(
                            text: (mrpSum() != 0) ? '₹ ${mrpSum()}' : '',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 15,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          if (cartitems.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderScreen(
                                  mrpprice: mrpPrice,
                                  payableprice: price,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Place Order',
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
