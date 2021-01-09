import 'package:flutter/material.dart';
import 'package:grocery_shop/Constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:grocery_shop/CartScreen.dart';

class ProductDescription extends StatefulWidget {
  final product products;

  ProductDescription({this.products});

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String genre = widget.products.genre;
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Container(
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image(
                    image: AssetImage(widget.products.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              color: widget.products.color,
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.grey[50],
              ),
              actions: [
                IconButton(
                  icon: Icon(MdiIcons.cart),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          items: widget.products,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        blurRadius: 15,
                        spreadRadius: 1.5),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      widget.products.title,
                                      style: kTextStyle.copyWith(fontSize: 23),
                                    ),
                                    Text(
                                      (widget.products.quantity != null)
                                          ? '[${widget.products.quantity} ${widget.products.unit}]'
                                          : '[${widget.products.unit}]',
                                      style: kTextStyle.copyWith(
                                        fontSize: 17,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: RichText(
                                    text: TextSpan(
                                      text: '₹ ${widget.products.price}\n',
                                      style: kTextStyle.copyWith(fontSize: 25),
                                      children: [
                                        TextSpan(
                                          text: '₹ ${widget.products.mrp}',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 16,
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
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Quantity'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: IconButton(
                                        icon: Icon(
                                          MdiIcons.minusBox,
                                          size: 35,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            widget.products.requiredQuantity > 1
                                                ? widget.products
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
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${widget.products.requiredQuantity}',
                                          style: kTextStyle.copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
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
                                            widget.products.requiredQuantity <
                                                    99
                                                ? widget.products
                                                    .requiredQuantity += 1
                                                : null;
                                          });
                                        }),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Details:',
                            style: kTextStyle.copyWith(
                                fontSize: 16, color: Colors.grey[600]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              'Manufacture Date: ${widget.products.mfd}',
                              style: kTextStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Expire Date: ${widget.products.exp}',
                              style: kTextStyle,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                (widget.products.quantity != null)
                                    ? 'Quantity: ${widget.products.quantity} ${widget.products.unit}'
                                    : 'Size: ${widget.products.unit}',
                                style: kTextStyle,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(5),
                          child: ((prodDescription[index].genre == genre) &&
                                  !(prodDescription[index].title ==
                                      widget.products.title))
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDescription(products: prodDescription[index],)));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 90,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      prodDescription[index]
                                                          .image))),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '${prodDescription[index].title}',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                Text(
                                                  (prodDescription[index]
                                                              .quantity !=
                                                          null)
                                                      ? '[${prodDescription[index].quantity} ${prodDescription[index].unit}]'
                                                      : '[${prodDescription[index].unit}]',
                                                  style: kTextStyle.copyWith(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '₹ ${prodDescription[index].price}',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 0,
                                ),
                        ),
                        itemCount: prodDescription.length,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.915,
              left: MediaQuery.of(context).size.width / 5,
              right: MediaQuery.of(context).size.width / 5,
              child: Builder(
                builder: (context) => FlatButton(
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 1),
                        action: SnackBarAction(
                          label: 'Remove item',
                          onPressed: () {
                            widget.products.cartCheck = false;
                            cartitems.remove(widget.products);
                          },
                        ),
                        content: Text(
                          widget.products.cartCheck
                              ? 'Item already added'
                              : 'Item added to cart',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    );
                    setState(
                      () {
                        if (widget.products.cartCheck == false) {
                          cartitems.add(widget.products);
                          widget.products.cartCheck = true;
                        }
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15, top: 15),
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Add to cart',
                            style: kTextStyle.copyWith(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 8),
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 6,
                                  spreadRadius: 0.5)
                            ],
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.red[600]),
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
