import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/CartScreen.dart';
import 'package:grocery_shop/Shopping%20Live/MyBaggage.dart';
import 'package:grocery_shop/Shopping%20Live/Parking.dart';
import 'package:grocery_shop/Shopping%20Live/TrackDelivery.dart';
import 'package:grocery_shop/Validate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ShoppingLive extends StatelessWidget {
  static const id = "ShoppingLive";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.15),
          child: Center(
            child: Text(
              'Shopping Live',
              style: GoogleFonts.architectsDaughter(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.green),
            ),
          ),
        ),
      ),
      body: Consumer<Validate>(
        builder:(context,validate,child)=> Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            validate.isLocal?SizedBox(height: 0,):GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(MdiIcons.cart),
                title: Text(
                  'My cart',
                  style: GoogleFonts.robotoMono(fontSize: 20),
                ),
              ),
            ),
            validate.isLocal?SizedBox(height: 0,):Divider(
              thickness: 1,
            ),
            validate.isLocal?GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBaggage(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(MdiIcons.bagChecked),
                title: Text(
                  'My baggage',
                  style: GoogleFonts.robotoMono(fontSize: 20),
                ),
              ),
            ):SizedBox(height: 0,),
            validate.isLocal?Divider(
              thickness: 1,
            ):SizedBox(height: 0,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrackDelivery(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(MdiIcons.truckDelivery),
                title: Text(
                  'Track Delivery',
                  style: GoogleFonts.robotoMono(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
