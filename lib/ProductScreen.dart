import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/DrawerScreens/GroupShopping.dart';
import 'package:grocery_shop/MainScreen.dart';
import 'package:grocery_shop/ProductDescription.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:grocery_shop/Constants.dart';
import 'DrawerScreens/Profile.dart';
import 'DrawerScreens/ShoppingHistory.dart';
import 'DrawerScreens/ShoppingLive.dart';

int cartCount;
String StoreTitle;
String StoreAddress;

void cartNum() {
  cartCount = cartitems.length;
}

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
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(prodDescription.length);
    StoreTitle = widget.productitem.title;
    StoreAddress = widget.productitem.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        elevation: 70,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50, left: 20, bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/trolley.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Trolley',
                          style: GoogleFonts.pacifico(
                              fontSize: 28,
                              color: Colors.grey[800],
                              letterSpacing: 1.5),
                        )
                      ],
                    ),
                  ),
                  drawerText(
                    text: 'Profile',
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      );
                    },
                  ),
                  drawerText(
                    text: 'Nearby Store',
                    onpressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        'main',
                      );
                    },
                  ),
                  drawerText(
                    text: 'Shopping History',
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingHistory(),
                        ),
                      );
                    },
                  ),
                  drawerText(
                    text: 'Shopping Live',
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingLive(),
                        ),
                      );
                    },
                  ),
                  drawerText(
                    text: 'Group Shopping',
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GroupShopping(),
                        ),
                      );
                    },
                  ),
                  drawerText(
                    text: 'Sign Out',
                    onpressed: () async {
                      _auth.signOut();
                      if (_auth.currentUser == null) {
                        Navigator.pushReplacementNamed(context, 'welcome');
                      }
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Contact us',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                              icon: Icon(
                                MdiIcons.facebook,
                                size: 35,
                                color: Colors.blue[800],
                              ),
                              onPressed: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                              icon: Icon(
                                MdiIcons.twitter,
                                size: 35,
                                color: Colors.blue[400],
                              ),
                              onPressed: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                              icon: Icon(
                                MdiIcons.instagram,
                                size: 35,
                                color: Colors.red,
                              ),
                              onPressed: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                              icon: Icon(
                                MdiIcons.gmail,
                                size: 35,
                                color: Colors.red[700],
                              ),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      MdiIcons.phone,
                      size: 30,
                    ),
                    title: Text(
                      '+91 99XXX 99XXX ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ]),
      ),
      appBar: AppBar(
        title: onSearch
            ? Container(
                height: 50,
                width: 250,
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
                      builder: (context) => ProductDescription(
                        products: index,
                        storeTitle: StoreTitle,
                        storeAddress: StoreAddress,
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
            icon: onSearch
                ? Icon(MdiIcons.close,color: Colors.green,)
                : Icon(
                    MdiIcons.magnify,
              color: Colors.green,
                  ),
            onPressed: () {
              setState(() {
                onSearch = !onSearch;
              });
            },
          ),
          SizedBox(
            width: 10,
          ),
          // TODO:CartButton IconButton(
          //   icon: Icon(
          //     MdiIcons.cart,
          //     size: 30,
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => CartScreen(),
          //       ),
          //     );
          //   },
          // ),
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
              padding: EdgeInsets.only(top: 5, bottom: 20, right: 10),
              child: Center(
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
                          var code = barcode.toString();
                          for (int i = 0; i < prodDescription.length; i++) {
                            if (code == prodDescription[i].barcode) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDescription(
                                    products: prodDescription[i],
                                    storeTitle: StoreTitle,
                                    storeAddress: StoreAddress,
                                  ),
                                ),
                              );
                            }
                          }
                        } else {
                          barcode = '';
                        }
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
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
              storeTitle: StoreTitle,
              storeAddress: StoreAddress,
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
}
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
),
Expanded(
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
