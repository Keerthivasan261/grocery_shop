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
  bool cartCheck;
  int requiredQuantity;

  product({
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
      mrp: 440,
      mfd: 'dd/mm/yyyy',
      exp: 'dd/mm/yyyy',
      title: 'Boost',
      genre: 'Energy Drinks',
      price: 400,
      quantity: 1,
      requiredQuantity: 1,
      unit: 'kg',
      image: 'images/boost.png',
      color: Colors.red[600].withOpacity(0.5),
      cartCheck: false),
  product(
      mrp: 45,
      mfd: 'dd/mm/yyyy',
      exp: 'dd/mm/yyyy',
      title: 'Snickers',
      genre: 'Chocolates',
      price: 40,
      quantity: null,
      requiredQuantity: 1,
      unit: 'medium',
      image: 'images/snickers.png',
      color: Colors.brown[300],
      cartCheck: false),
  product(
      mrp: 87,
      mfd: 'dd/mm/yyyy',
      exp: 'dd/mm/yyyy',
      title: 'Coke',
      genre: 'Juices',
      price: 80,
      quantity: 1,
      requiredQuantity: 1,
      unit: 'l',
      image: 'images/coke.png',
      color: Colors.red[400],
      cartCheck: false),
  product(
      mrp: 200,
      mfd: 'dd/mm/yyyy',
      exp: 'dd/mm/yyyy',
      title: 'Axe',
      genre: 'Beauty',
      price: 180,
      quantity: 210,
      requiredQuantity: 1,
      unit: 'ml',
      image: 'images/axe.png',
      color: Colors.blue[300],
      cartCheck: false),
  product(
      mrp: 230,
      mfd: 'dd/mm/yyyy',
      exp: 'dd/mm/yyyy',
      title: 'Boost',
      genre: 'Energy Drinks',
      price: 220,
      quantity: 500,
      requiredQuantity: 1,
      unit: 'g',
      image: 'images/boost.png',
      color: Colors.red[400],
      cartCheck: false),
  product(
      mrp: 25,
      mfd: 'dd/mm/yyyy',
      exp: 'dd/mm/yyyy',
      title: 'Snickers',
      genre: 'Chocolates',
      price: 20,
      quantity: null,
      requiredQuantity: 1,
      unit: 'small',
      image: 'images/snickers.png',
      color: Colors.brown[300],
      cartCheck: false),
  product(
      mrp: 60,
      mfd: 'dd/mm/yyyy',
      exp: 'dd/mm/yyyy',
      title: 'Coke',
      genre: 'Juices',
      price: 50,
      quantity: 500,
      requiredQuantity: 1,
      unit: 'ml',
      image: 'images/coke.png',
      color: Colors.red[400],
      cartCheck: false),
];
