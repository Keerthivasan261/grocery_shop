import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTextStyle =
    GoogleFonts.robotoMono(color: Colors.grey[800], fontSize: 18);

class product {
  final int mrp;
  final String title;
  final String genre;
  final int price;
  final int quantity;
  final String unit;
  final String image;
  final Color color;
  final String mfd;
  final String exp;
  final String barcode;
  final String fssaiNo;
  final double proteins;
  final double vitamins;
  final String ownerInfo;
  final String phoneNumber;
  final double rating;
  final int reviewers;
  final int row;
  final int column;
  final int shelf;
  bool cartCheck;
  int requiredQuantity;

  product({
    this.vitamins,
    this.fssaiNo,
    this.proteins,
    this.ownerInfo,
    this.phoneNumber,
    this.row,
    this.column,
    this.shelf,
    this.rating,
    this.reviewers,
    this.barcode,
    this.mrp,
    this.mfd,
    this.exp,
    this.requiredQuantity,
    this.unit,
    this.quantity,
    this.color,
    @required this.cartCheck,
    @required this.image,
    @required this.title,
    @required this.genre,
    @required this.price,
  });
}

List<product> cartitems = [];
List<product> prodDescription = [
  product(
    mrp: 125,
    mfd: 'dd/mm/yyyy',
    exp: 'dd/mm/yyyy',
    title: 'MilkMaid-Nestle',
    genre: 'food',
    price: 115,
    quantity: 400,
    barcode: '8901058100600',
    requiredQuantity: 1,
    unit: 'g',
    rating: 4.5,
    reviewers: 179,
    fssaiNo: "12216017000XXX",
    proteins: 15.0,
    vitamins: 20.0,
    ownerInfo: "Mr.X",
    phoneNumber: "90909XXXXX",
    row: 3,
    column: 1,
    shelf: 2,
    image: 'images/milkmaid.png',
    color: Colors.blue[200],
    cartCheck: false,
  ),
  product(
    mrp: 54,
    mfd: 'dd/mm/yyyy',
    exp: 'dd/mm/yyyy',
    title: 'Dettol soap',
    genre: 'body care',
    price: 49,
    quantity: 125,
    barcode: '8901396397632',
    requiredQuantity: 1,
    unit: 'g',
    rating: 4.5,
    reviewers: 179,
    fssaiNo: "12216017000XXX",
    proteins: 0,
    vitamins: 0,
    ownerInfo: "Mr.X",
    phoneNumber: "90909XXXXX",
    row: 1,
    column: 3,
    shelf: 1,
    image: 'images/dettol.png',
    color: Colors.green[300],
    cartCheck: false,
  ),
  product(
    mrp: 230,
    mfd: 'dd/mm/yyyy',
    exp: 'dd/mm/yyyy',
    title: 'Boost',
    genre: 'food',
    price: 220,
    quantity: 500,
    barcode: '8901571000043',
    requiredQuantity: 1,
    unit: 'g',
    rating: 4.5,
    reviewers: 179,
    fssaiNo: "12216017000XXX",
    proteins: 11.0,
    vitamins: 8.0,
    ownerInfo: "Mr.X",
    phoneNumber: "90909XXXXX",
    row: 2,
    column: 5,
    shelf: 2,
    image: 'images/boost.png',
    color: Colors.red[300],
    cartCheck: false,
  ),
  product(
    mrp: 60,
    mfd: 'dd/mm/yyyy',
    exp: 'dd/mm/yyyy',
    title: 'Coca-cola',
    genre: 'food',
    price: 50,
    quantity: 500,
    barcode: '54491472',
    requiredQuantity: 1,
    unit: 'ml',
    rating: 4.5,
    reviewers: 179,
    fssaiNo: "12216017000XXX",
    proteins: 7.0,
    vitamins: 9.0,
    ownerInfo: "Mr.X",
    phoneNumber: "90909XXXXX",
    row: 2,
    column: 1,
    shelf: 5,
    image: 'images/coke.png',
    color: Colors.red[300],
    cartCheck: false,
  ),
  product(
    mrp: 100,
    mfd: 'dd/mm/yyyy',
    exp: 'dd/mm/yyyy',
    title: 'Tide Plus',
    genre: 'body care',
    price: 90,
    quantity: 1,
    barcode: '4902430875042',
    requiredQuantity: 1,
    unit: 'kg',
    rating: 4.5,
    reviewers: 179,
    fssaiNo: "12216017000XXX",
    proteins: 0,
    vitamins: 0,
    ownerInfo: "Mr.X",
    phoneNumber: "90909XXXXX",
    row: 2,
    column: 3,
    shelf: 5,
    image: 'images/tide.png',
    color: Colors.red[300],
    cartCheck: false,
  ),
  product(
    mrp: 200,
    mfd: 'dd/mm/yyyy',
    exp: 'dd/mm/yyyy',
    title: 'Axe',
    genre: 'body care',
    price: 180,
    quantity: 210,
    barcode: '079400260932',
    requiredQuantity: 1,
    unit: 'ml',
    rating: 4.5,
    reviewers: 179,
    fssaiNo: "12216017000XXX",
    proteins: 0,
    vitamins: 0,
    ownerInfo: "Mr.X",
    phoneNumber: "90909XXXXX",
    row: 2,
    column: 3,
    shelf: 3,
    image: 'images/axe.png',
    color: Colors.blue[200],
    cartCheck: false,
  ),
  product(
    mrp: 45,
    mfd: 'dd/mm/yyyy',
    exp: 'dd/mm/yyyy',
    title: 'Snickers',
    genre: 'food',
    price: 40,
    quantity: null,
    barcode: '040000001027',
    requiredQuantity: 1,
    unit: 'medium',
    rating: 4.5,
    reviewers: 179,
    fssaiNo: "12216017000XXX",
    proteins: 7.0,
    vitamins: 9.0,
    ownerInfo: "Mr.X",
    phoneNumber: "90909XXXXX",
    row: 2,
    column: 3,
    shelf: 4,
    image: 'images/snickers.png',
    color: Colors.brown[300],
    cartCheck: false,
  ),
  product(
    mrp: 130,
    mfd: 'dd/mm/yyyy',
    exp: 'dd/mm/yyyy',
    title: 'Pringles',
    genre: 'food',
    price: 99,
    quantity: 107,
    barcode: '038000844966',
    requiredQuantity: 1,
    unit: 'g',
    rating: 4.5,
    reviewers: 179,
    fssaiNo: "12216017000XXX",
    proteins: 9.0,
    vitamins: 8.0,
    ownerInfo: "Mr.X",
    phoneNumber: "90909XXXXX",
    row: 2,
    column: 3,
    shelf: 2,
    image: 'images/pringles.png',
    color: Colors.red[300],
    cartCheck: false,
  ),
  product(
    mrp: 200,
    mfd: 'dd/mm/yyyy',
    exp: 'dd/mm/yyyy',
    title: 'Heinz Sauce',
    genre: 'food',
    price: 180,
    quantity: 500,
    barcode: '013000626095',
    requiredQuantity: 1,
    unit: 'g',
    rating: 4.5,
    reviewers: 179,
    fssaiNo: "12216017000XXX",
    proteins: 12.0,
    vitamins: 8.0,
    ownerInfo: "Mr.X",
    phoneNumber: "90909XXXXX",
    row: 2,
    column: 3,
    shelf: 1,
    image: 'images/Ketchup.png',
    color: Colors.brown[300],
    cartCheck: false,
  ),
];

class drawerText extends StatelessWidget {
  final String text;
  final Function onpressed;

  const drawerText({
    this.onpressed,
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 25),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
