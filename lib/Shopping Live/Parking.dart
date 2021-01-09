import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Parking extends StatefulWidget {
  @override
  _ParkingState createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 10,
                color: Colors.grey[600].withOpacity(0.7))
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 20,
                    child: RichText(
                      text: TextSpan(
                        text: 'Parking ID: ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: '102',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 80,
                    child: Text(
                      'TN XX AA XXXX',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 60,
                    child: Text(
                      'Vehicle No.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: MediaQuery.of(context).size.width*0.58,
                    child: RichText(
                      text: TextSpan(
                        text: 'Parked Place: ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: '2AX',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              subtitle: RichText(
                text: TextSpan(
                  text: 'Security Name:  ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Mr. xxxx',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Contact for queries',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              ),
              trailing: IconButton(icon: Icon(MdiIcons.phone,color: Colors.red,size: 28,),onPressed: (){
              },),
            )
          ],
        ),
      ),
    );
  }
}
