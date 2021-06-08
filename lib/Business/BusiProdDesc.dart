import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/Constants.dart';
import 'package:grocery_shop/Validate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class BusiProdDesc extends StatefulWidget {
  static const id = "BusiProdDesc";
  final product products;
  final String storeTitle;

  BusiProdDesc({this.products, this.storeTitle});

  @override
  _BusiProdDescState createState() => _BusiProdDescState();
}

class _BusiProdDescState extends State<BusiProdDesc> {
  GlobalKey _key = GlobalKey<AutoCompleteTextFieldState<product>>();
  bool onSearch = false;
  String barcode = '';

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
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {},
        label: Text(
          "Edit Products",
          style: TextStyle(fontSize: 15),
        ),
        icon: Icon(MdiIcons.playlistEdit),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Consumer<Validate>(
          builder: (context, validate, child) => Stack(children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(children: [
                          IconButton(
                            icon: Icon(MdiIcons.arrowLeft),
                            color: Colors.green,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          onSearch
                              ? Expanded(
                                  child: Container(
                                    height: 48,
                                    width: 200,
                                    child: AutoCompleteTextField<product>(
                                      decoration: InputDecoration(
                                        hintText: 'Search for products',
                                        hintStyle: kTextStyle.copyWith(
                                            color: Colors.grey[800],
                                            fontSize: 16,
                                            decorationStyle:
                                                TextDecorationStyle.dotted),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.grey[400]),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3,
                                              color: Colors.green[400]),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                          builder: (context) => BusiProdDesc(
                                            products: index,
                                            storeTitle: widget.storeTitle,
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
                              : Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 3,left: 10),
                                    child: Text(
                                      widget.storeTitle,
                                      style: kTextStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green),
                                    ),
                                  ),
                                ),
                          IconButton(
                            icon: onSearch
                                ? Icon(MdiIcons.close)
                                : Icon(MdiIcons.magnify),
                            color: Colors.green,
                            iconSize: 28,
                            onPressed: () {
                              setState(() {
                                onSearch = !onSearch;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(MdiIcons.barcodeScan),
                            color: Colors.green,
                            iconSize: 30,
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
                                    var code = barcode.toString();
                                    for (int i = 0;
                                        i < prodDescription.length;
                                        i++) {
                                      if (code == prodDescription[i].barcode) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BusiProdDesc(
                                              products: prodDescription[i],
                                              storeTitle: widget.storeTitle,
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
                          IconButton(
                            icon: Icon(MdiIcons.shareVariant),
                            color: Colors.green,
                            iconSize: 25,
                            onPressed: () {},
                          ),
                        ]),
                      ],
                    ),
                  ),
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
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(),
                      ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(widget.products.title,
                                              style: GoogleFonts.openSans(
                                                  fontSize: 23)),
                                          SizedBox(
                                            height: 5,
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
                                            text:
                                                '₹ ${widget.products.price}\n',
                                            style: kTextStyle.copyWith(
                                                fontSize: 25),
                                            children: [
                                              TextSpan(
                                                text:
                                                    '₹ ${widget.products.mrp}',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 10),
                                child: Divider(
                                  thickness: 1.3,
                                  indent: 15,
                                  endIndent: 15,
                                  color: widget.products.color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Details:',
                              style: kTextStyle.copyWith(
                                  fontSize: 16, color: Colors.grey[700]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                'Mfd: ${widget.products.mfd}',
                                style: kTextStyle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'Exp: ${widget.products.exp}',
                                style: kTextStyle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                (widget.products.quantity != null)
                                    ? 'Qty: ${widget.products.quantity} ${widget.products.unit}'
                                    : 'Size: ${widget.products.unit}',
                                style: kTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Container(
                            width: 1.5, height: 100, color: Colors.grey[300]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Rating:',
                              style: kTextStyle.copyWith(
                                  fontSize: 18, color: Colors.grey[700]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    '${widget.products.rating} ',
                                    style: kTextStyle,
                                  ),
                                  Icon(
                                    MdiIcons.star,
                                    color: Color(0xFFF3C418),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'reviewed by \n${widget.products.reviewers}',
                                textAlign: TextAlign.center,
                                style: kTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  widget.products.offer != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Divider(
                            thickness: 1,
                            indent: 30,
                            endIndent: 30,
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  widget.products.offer != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "images/offer.png",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    '${widget.products.offer}',
                                    style: GoogleFonts.pacifico(
                                        fontSize: 24,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Location:',
                          style: kTextStyle.copyWith(
                              fontSize: 16, color: Colors.grey[700]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            'Row: ${widget.products.row}',
                            style: kTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Column: ${widget.products.column}',
                            style: kTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Shelf: ${widget.products.shelf}',
                            style: kTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Related Details:',
                          style: kTextStyle.copyWith(
                              fontSize: 16, color: Colors.grey[700]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            'Genre: ${widget.products.genre}',
                            style: kTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            'Barcode No: ${widget.products.barcode}',
                            style: kTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Row(
                            children: [
                              Text(
                                'Related color: ',
                                style: kTextStyle,
                              ),
                              Container(
                                height: 25,
                                width: 100,
                                color: widget.products.color,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "Related products",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    height: MediaQuery.of(context).size.height * 0.14,
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
                                        builder: (context) => BusiProdDesc(
                                          products: prodDescription[index],
                                          storeTitle: widget.storeTitle,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 0.2,
                                            blurRadius: 7,
                                            color: Colors.grey[500],
                                            offset: Offset(0.8, 0.9),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200]),
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
                                )),
                      itemCount: prodDescription.length,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Parent company:',
                          style: kTextStyle.copyWith(
                              fontSize: 18, color: Colors.grey[700]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 50,
                          ),
                          child: Container(
                            height: 60,
                            width: 100,
                            child: Image(
                              image: AssetImage(widget.products.brand),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Other Details:',
                          style: kTextStyle.copyWith(
                              fontSize: 18, color: Colors.grey[700]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50, top: 10),
                          child: Text(
                            'fssai no:${widget.products.fssaiNo}',
                            style: kTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ingredients:',
                          style: kTextStyle.copyWith(
                              fontSize: 18, color: Colors.grey[700]),
                        ),
                        (widget.products.proteins != 0)
                            ? Padding(
                                padding: EdgeInsets.only(left: 15, top: 10),
                                child: Text(
                                  'Proteins (${widget.products.proteins}) ',
                                  style: kTextStyle,
                                ),
                              )
                            : SizedBox(
                                height: 1,
                              ),
                        (widget.products.vitamins != 0)
                            ? Padding(
                                padding: EdgeInsets.only(left: 15, top: 10),
                                child: Text(
                                  'Vitamins (${widget.products.vitamins}) ',
                                  style: kTextStyle,
                                ),
                              )
                            : SizedBox(
                                height: 1,
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manager/Owner info',
                          style: kTextStyle.copyWith(
                              fontSize: 18, color: Colors.grey[700]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            'Name:${widget.products.ownerInfo}',
                            style: kTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            'Ph no:${widget.products.phoneNumber}',
                            style: kTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
