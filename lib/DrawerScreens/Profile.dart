import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Profile extends StatelessWidget {

  final auth = FirebaseAuth.instance;

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
              'Edit Profile',
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
            trailing: Icon(MdiIcons.emailEdit,size: 28,),
            title: Text('${auth.currentUser.email}',style: GoogleFonts.robotoMono(fontSize: 18),),
          ),
          Divider(thickness: 1,),
          ListTile(
            trailing: Icon(MdiIcons.accountEdit,size: 32,),
            title: Text('\'username\'',style: GoogleFonts.robotoMono(fontSize: 18),),
          ),
          Divider(thickness: 1,),
          ListTile(
            trailing: Icon(MdiIcons.phone,size: 32,),
            title: Text('+91 99999 xxxxx',style: GoogleFonts.robotoMono(fontSize: 20),),
          ),
          Divider(thickness: 1,),
          ListTile(
            trailing: Icon(MdiIcons.clipboardEdit),
            title: Text('Change password',style: GoogleFonts.robotoMono(fontSize: 20),),
          ),
        ],
      ),
    );
  }
}
