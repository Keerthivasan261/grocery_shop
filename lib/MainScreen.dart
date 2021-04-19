import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/Constants.dart';
import 'package:grocery_shop/DrawerScreens/GroupShopping.dart';
import 'package:grocery_shop/DrawerScreens/NearbyStore.dart';
import 'package:grocery_shop/DrawerScreens/Profile.dart';
import 'package:grocery_shop/DrawerScreens/ShoppingHistory.dart';
import 'package:grocery_shop/DrawerScreens/ShoppingLive.dart';
import 'package:grocery_shop/ProductScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Store storename;

class Store {
  final String title;
  final String address;

  Store({
    @required this.title,
    @required this.address,
  });
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  String barcode = '';
  var controller = TextEditingController();
  GlobalKey key = GlobalKey<AutoCompleteTextFieldState<Store>>();
  Store selected ;
  List<Store> StoreDescription = [
    Store(
      title: 'ABC Super Market',
      address: 'Bangalore',
    ),
    Store(
      title: 'PQR Super Market',
      address: 'Chennai',
    ),
    Store(
      title: 'XYZ Super Market',
      address: 'Mumbai',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(_auth.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010b19),
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
                              color: Colors.green,
                              letterSpacing: 1.5),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: AssetImage('images/unknownuser.jpg'),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            '${_auth.currentUser.email}',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NearbyStore(stores: StoreDescription),
                        ),
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
                      await _auth.signOut();
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
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/4.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.srgbToLinearGamma(),
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/4.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      actions: [],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[200]),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.63,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(50, 0, 50, 15),
                          child: Builder(
                            builder: (context) => AutoCompleteTextField<Store>(
                              decoration: InputDecoration(
                                  hintText: 'Search your store',
                                  hintStyle: TextStyle(),
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.green[400]),
                                      borderRadius: BorderRadius.circular(5))),
                              suggestions: StoreDescription,
                              key: key,
                              itemSubmitted: (item) async {
                                selected = item;
                                storename = item;
                                return selected.title == null
                                    ? Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Invalid data!!  Try Again'),
                                        ),
                                      )
                                    : Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductScreen(
                                            productitem: selected,
                                          ),
                                        ),
                                      );
                              },
                              itemBuilder: (context, item) => ListTile(
                                title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        item.address,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700]),
                                      ),
                                    ]),
                              ),
                              itemFilter: (suggestion, input) => suggestion
                                  .title
                                  .toLowerCase()
                                  .startsWith(input.toLowerCase()),
                              itemSorter: (a, b) {
                                return 1;
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'or',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: FlatButton(
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(spreadRadius: 0.2,blurRadius: 7,color: Colors.grey,offset: Offset(3,5))
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Scan QR',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      MdiIcons.qrcodeScan,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ]),
                            ),
                            onPressed: () async {
                              try {
                                barcode =
                                    await FlutterBarcodeScanner.scanBarcode(
                                        '#ffff1100',
                                        'Cancel',
                                        true,
                                        ScanMode.BARCODE);
                                setState(() {
                                  if (barcode != '-1') {
                                    int code = int.parse(barcode);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductScreen(
                                          productitem:
                                              StoreDescription[code - 1],
                                        ),
                                      ),
                                    );
                                  } else {
                                    barcode = '';
                                  }
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
