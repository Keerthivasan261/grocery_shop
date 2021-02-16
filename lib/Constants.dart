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
  final String category;
  final String description;
  final Color color;
  final String mfd;
  final String exp;
  final String barcode;
  bool cartCheck;
  int requiredQuantity;

  product({
    this.barcode,
    this.mrp,
    this.mfd,
    this.exp,
    this.requiredQuantity,
    this.category,
    this.unit,
    this.quantity,
    this.description,
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
      image: 'images/dettol.png',
      color: Colors.green[600].withOpacity(0.5),
      cartCheck: false),
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
      image: 'images/boost.png',
      color: Colors.red[400],
      cartCheck: false),
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
      image: 'images/coke.png',
      color: Colors.red[400],
      cartCheck: false),
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
      image: 'images/tide.png',
      color: Colors.red[400],
      cartCheck: false),
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
      image: 'images/axe.png',
      color: Colors.blue[300],
      cartCheck: false),
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
      image: 'images/snickers.png',
      color: Colors.brown[300],
      cartCheck: false),
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
      image: 'images/pringles.png',
      color: Colors.red[300],
      cartCheck: false),

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
      image: 'images/Ketchup.png',
      color: Colors.brown[300],
      cartCheck: false),
  product(
      mrp: 12,
      mfd: 'dd/mm/yyyy',
      exp: 'dd/mm/yyyy',
      title: 'Maggi noodles',
      genre: 'food',
      price: 10,
      quantity: 70,
      barcode: '013000626095',
      requiredQuantity: 1,
      unit: 'g',
      image: 'images/maggi.png',
      color: Colors.yellow[700],
      cartCheck: false),
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