import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/Business/BusiProdDesc.dart';
import 'package:grocery_shop/MainScreen.dart';
import 'package:grocery_shop/ProductDescription.dart';
import 'package:grocery_shop/Validate.dart';
import 'package:grocery_shop/Constants.dart';
import 'package:provider/provider.dart';

int cartCount;
String StoreTitle;
String StoreAddress;

class BusiProduct extends StatefulWidget {
  static const id = "BusiProduct";
  final String storeName;
  final String address;

  BusiProduct({this.storeName, this.address});

  @override
  _BusiProductState createState() => _BusiProductState();
}

class _BusiProductState extends State<BusiProduct> {
  String barcode = '';
  GlobalKey _key = GlobalKey<AutoCompleteTextFieldState<product>>();
  bool onSearch = false;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(prodDescription.length);
    StoreTitle = widget.storeName;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Validate>(
      builder: (context,validate,child)=> Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.storeName,
            style:
            kTextStyle.copyWith(fontSize: 20,
                fontWeight: FontWeight.w600,color: Colors.green),
          ),
          backgroundColor: Colors.white,
          elevation: 8,
          iconTheme: IconThemeData(color: Colors.green),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: SizedBox(child: AutoCompleteTextField<product>(
                  decoration: InputDecoration(
                    hintText: 'Search for products',
                    hintStyle: kTextStyle.copyWith(
                        color: Colors.grey[600],
                        fontSize: 16,
                        decorationStyle: TextDecorationStyle.dotted),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 3, color: Colors.green[400]),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  key: _key,
                  suggestions: prodDescription,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(index.title),
                    trailing: (index.quantity != null)
                        ? Text('Quantity: (${index.quantity} ${index.unit})')
                        : Text('Size: ${index.unit}'),
                  ),
                  itemSubmitted: (index) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BusiProdDesc(
                        products: index,
                        storeTitle: StoreTitle,
                      ),
                    ),
                  ),
                  itemSorter: (a, b) => a.price == b.price
                      ? 0
                      : a.price > b.price
                      ? -1
                      : 1,
                  itemFilter: (sugg, input) =>
                      sugg.title.toLowerCase().startsWith(input.toLowerCase()),
                ),),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemCount: prodDescription.length,
                  itemBuilder: (context, index) => Card(
                    indexvalue: index,
                    products: prodDescription[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final product products;
  final int indexvalue;

  Card({this.products, this.indexvalue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BusiProdDesc(
              storeTitle: StoreTitle,
              products: products,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(spreadRadius: 0.4,blurRadius: 7,color: Colors.grey[200],)],
          color: Colors.white,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: (indexvalue == 0 || indexvalue == 1) ? 20 : 0),
                child: Stack(children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Center(
                        child: Image(
                          image: AssetImage(products.image),
                        )),
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  ),
                  (indexvalue == 0 || indexvalue == 1)
                      ? Container(
                    height: 20,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(15, 15),
                            bottomRight: Radius.elliptical(15, 15)),
                        color: Colors.green.withOpacity(0.8)),
                    child: Center(
                      child: Text(
                        'Ad',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                      : Container(),
                ]),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(top: 5, right: (indexvalue % 2 != 0) ? 10 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(right: 5,left: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        products.title,
                        style: kTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        text: '₹ ${products.price}\n',
                        style: kTextStyle.copyWith(fontSize: 20),
                        children: [
                          TextSpan(
                            text: '₹ ${products.mrp}',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
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
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    (products.quantity != null)
                        ? '(${products.quantity} ${products.unit})'
                        : 'size: ${products.unit}',
                    style: GoogleFonts.sarabun(color: Colors.red, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
