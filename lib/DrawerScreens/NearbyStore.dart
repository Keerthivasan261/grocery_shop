import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/ProductScreen.dart';

class NearbyStore extends StatelessWidget {
  List stores;

  NearbyStore({this.stores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Padding(
          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.1),
          child: Center(
            child: Text(
              'Available stores',
              style:
                  GoogleFonts.architectsDaughter(fontSize: 35, fontWeight: FontWeight.w500,color: Colors.green),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(
                        productitem: stores[index],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    '${stores[index].title}',
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    '${stores[index].address}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
