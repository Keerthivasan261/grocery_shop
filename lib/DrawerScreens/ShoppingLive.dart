import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShoppingLive extends StatelessWidget {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(MdiIcons.cart),
            title: Text('My cart',style: GoogleFonts.robotoMono(fontSize: 20),),
          ),
          Divider(thickness: 1,),
          ListTile(
            leading: Icon(MdiIcons.car),
            title: Text('Parking',style: GoogleFonts.robotoMono(fontSize: 20),),
          ),
          Divider(thickness: 1,),
          ListTile(
            leading: Icon(MdiIcons.bagChecked),
            title: Text('My baggage',style: GoogleFonts.robotoMono(fontSize: 20),),
          ),
          Divider(thickness: 1,),
          ListTile(
            leading: Icon(MdiIcons.truckDelivery),
            title: Text('Track Delivery',style: GoogleFonts.robotoMono(fontSize: 20),),
          ),
        ],
      ),
    );
  }
}
