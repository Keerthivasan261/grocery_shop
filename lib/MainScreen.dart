import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:grocery_shop/ProductScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class Store {
  final String title;
  final String address;
  final double rating;

  Store({
    @required this.title,
    @required this.address,
    @required this.rating,
  });
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String barcode = '';
  var controller = TextEditingController();
  GlobalKey key = GlobalKey<AutoCompleteTextFieldState<Store>>();
  Store selected;
  List<Store> StoreDescription = [
    Store(
        title: 'Jaisurya\'s Departmental Store',
        address: 'Fairlands',
        rating: 3.5),
    Store(
        title: 'Bharathi Super Market', address: 'Hasthampati', rating: 3.0),
    Store(title: 'Reliance Digital Market', address: '5 Roads', rating: 4.0),
    Store(
        title: 'Sellers Shop - Hyper Market',
        address: 'Kurangu saavadi',
        rating: 4.5),
    Store(
        title: 'Sellers Shop - Hyper Market',
        address: 'Hasthampatti',
        rating: 4.7),
    Store(
        title: 'Jaisurya\'s Departmental Store',
        address: '4 Roads',
        rating: 3.6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010b19),
      drawer: Drawer(
        elevation: 70,
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
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey[50]),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.63,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 15),
                            child: Builder(
                              builder: (context) =>
                                  AutoCompleteTextField<Store>(
                                decoration: InputDecoration(
                                  hintText: 'Search your nearby store',
                                  hintStyle: TextStyle(),
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                suggestions: StoreDescription,
                                key: key,
                                itemSubmitted: (item) async {
                                  selected = item;
                                  return selected.title == null
                                      ? Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Invalid data!!  Try Again'),
                                          ),
                                        )
                                      : Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductScreen(
                                              productitem: selected,
                                            ),
                                          ),);
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
                                        Divider(
                                          thickness: 1,
                                        )
                                      ]),
                                  trailing: Text('${item.rating}'),
                                ),
                                itemFilter: (suggestion, input) => suggestion
                                    .title
                                    .toLowerCase()
                                    .startsWith(input.toLowerCase()),
                                itemSorter: (a, b) {
                                  return a.rating == b.rating
                                      ? 0
                                      : a.rating > b.rating
                                          ? -1
                                          : 1;
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
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red,
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Scan using QR',
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
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
