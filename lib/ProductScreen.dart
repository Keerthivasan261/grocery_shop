import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/MainScreen.dart';
import 'package:grocery_shop/ProductDescription.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:grocery_shop/Constants.dart';
import 'package:grocery_shop/CartScreen.dart';


class ProductScreen extends StatefulWidget {
  final Store productitem;

  ProductScreen({this.productitem});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String barcode = '';
  GlobalKey _key = GlobalKey<AutoCompleteTextFieldState<product>>();
  bool onSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        elevation: 70,
      ),
      appBar: AppBar(
        title: onSearch
            ? Expanded(
                child: Container(
                  height: 45,
                  child: AutoCompleteTextField<product>(
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
                            BorderSide(width: 3, color: Colors.red[600]),
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
                        builder: (context) => ProductDescription(
                          products: index,
                        ),
                      ),
                    ),
                    itemSorter: (a, b) => a.price == b.price
                        ? 0
                        : a.price > b.price
                            ? -1
                            : 1,
                    itemFilter: (sugg, input) => sugg.title
                        .toLowerCase()
                        .startsWith(input.toLowerCase()),
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productitem.title,
                    style:
                        kTextStyle.copyWith(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    widget.productitem.address,
                    style: kTextStyle.copyWith(
                        fontSize: 15, color: Colors.grey[500]),
                  )
                ],
              ),
        backgroundColor: Colors.white,
        elevation: 8,
        actions: [
          IconButton(
            icon: Icon(
              MdiIcons.magnify,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                onSearch == true ? onSearch = false : onSearch = true;
              });
            },
          ),
          IconButton(
            icon: Icon(
              MdiIcons.cart,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                '[Scan products using Barcode]',
                style: GoogleFonts.robotoMono(fontSize: 17),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5,bottom: 50, right: 10),
              child: Center(
                /*Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 30,
                        right: 15,
                      ),
                      height: 50,
                      child: AutoCompleteTextField<product>(
                        decoration: InputDecoration(
                          hintText: 'Search for products',
                          hintStyle: kTextStyle.copyWith(color: Colors.grey[600]),
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
                                BorderSide(width: 3, color: Colors.red[600]),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        key: _key,
                        suggestions: prodDescription,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(index.title),
                          trailing: (index.quantity != null)
                              ? Text(
                                  'Quantity: (${index.quantity} ${index.unit})')
                              : Text('Size: ${index.unit}'),
                        ),
                        itemSubmitted: (index) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDescription(
                              products: index,
                            ),
                          ),
                        ),
                        itemSorter: (a, b) => a.price == b.price
                            ? 0
                            : a.price > b.price
                                ? -1
                                : 1,
                        itemFilter: (sugg, input) => sugg.title
                            .toLowerCase()
                            .startsWith(input.toLowerCase()),
                      ),
                    ),
                  ),*/
                child: IconButton(
                  icon: Icon(
                    MdiIcons.barcodeScan,
                    color: Colors.grey[800],
                    size: 50,
                  ),
                  onPressed: () async {
                    try {
                      barcode = await FlutterBarcodeScanner.scanBarcode(
                          '#ffff1100', 'Cancel', true, ScanMode.BARCODE);
                      setState(() {
                        if (barcode != '-1') {
                          this.barcode = barcode;
                        } else {
                          barcode = '';
                        }
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                /*SizedBox(
                    width: 10,
                  )*/
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15),
                  itemCount: prodDescription.length,
                  itemBuilder: (context, index) => Card(
                    indexvalue: index,
                    products: prodDescription[index],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final product products;
  int indexvalue;
  String empty = '';

  Card({this.products, this.indexvalue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDescription(
              products: products,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(children: [
              (indexvalue == 0 || indexvalue == 1)
                  ? Container(
                      height: 20,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.elliptical(15, 15),
                              bottomRight: Radius.elliptical(15, 15)),
                          color: Colors.green.withOpacity(0.7)),
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
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: Image(
                  image: AssetImage(products.image),
                )),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  products.title,
                  style: kTextStyle.copyWith(fontSize: 20),
                ),
                RichText(
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
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    'All',
    'Beverages',
    'Dairy',
    'Home needs',
    'Chocolates',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        itemBuilder: (context, index) => buildCategories(index),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget buildCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print(index);
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              categories[index],
              style: kTextStyle.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width / 6,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color:
                          selectedIndex == index ? Colors.black : Colors.white,
                      blurRadius: 3)
                ],
                color: selectedIndex == index ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*class DataSearch extends SearchDelegate<String> {
  DataSearch({String text}) : super(
  );

  var res;
  bool check=false;

  final items = [
    'boost',
    'horlicks',
    'shampoo',
    'conditioner',
    'soap',
    'toothpaste',
    'dettol',
    'mouth wash',
    'shaving cream',
    'vinegar',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(MdiIcons.close),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(MdiIcons.arrowLeft),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if(check||items.contains(query)){
      return AlertDialog(
        title: Text(query),
        content: Container(
          height: 100,
          width: 300,
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: kTextStyle.copyWith(fontSize: 23),
              ))
        ],
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggList =
    items.where((product) => product.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          res = suggList[index];
          query = res;
          check=true;
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
            text: suggList[index].substring(0, query.length),
            style: kTextStyle.copyWith(
                color: Colors.red, fontSize: 23, fontWeight: FontWeight.w700),
            children: [
              TextSpan(
                  text: suggList[index].substring(query.length),
                  style: kTextStyle.copyWith(
                      color: Colors.grey[600],
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
      itemCount: suggList.length,
    );
  }
}*/

/*
IconButton(
onPressed: () async {
try {
barcode = await FlutterBarcodeScanner.scanBarcode(
'#ffff1100',
'Cancel',
true,
ScanMode.BARCODE);
setState(() {
if (barcode != '-1') {
this.barcode = barcode;
} else {
barcode = '';
}
});
} catch (e) {
print(e);
}
},
icon: Icon(
MdiIcons.barcodeScan,
size: 30,
color: Colors.white,
),
),*/
