import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TrackDelivery extends StatefulWidget {
  static const id = "TrackDelivery";
  @override
  _TrackDeliveryState createState() => _TrackDeliveryState();
}

class _TrackDeliveryState extends State<TrackDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Delivery'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 30,top: 50,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Delivery Status',style: TextStyle(fontSize: 19,color: Colors.green[800],fontWeight: FontWeight.w600),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[800]
                    ),
                    child: Icon(MdiIcons.check,color: Colors.white,size: 20,),
                  ),
                  SizedBox(width: 30,),
                  Text('Packed for shipping',style: TextStyle(fontSize: 16),)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15,top: 5,bottom: 5),
                child: Container(width: 1.5,height: 80,color: Colors.grey[400],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[800]
                    ),
                    child: Icon(MdiIcons.check,color: Colors.white,size: 20,),
                  ),
                  SizedBox(width: 30,),
                  Text('Shipped',style: TextStyle(fontSize: 16),)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15,top: 5,bottom: 5),
                child: Container(width: 1.5,height: 80,color: Colors.grey[300],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400]
                    ),
                    child: Icon(MdiIcons.mapMarkerQuestion,color: Colors.white,size: 25,),
                  ),
                  SizedBox(width: 30,),
                  Text('Yet to be delivered',style: TextStyle(fontSize: 16),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
