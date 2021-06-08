import 'package:flutter/material.dart';
import 'package:grocery_shop/Business%20Login.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BusiProdAdd extends StatefulWidget {
  static const id = "BusiProdAdd";

  @override
  _BusiProdAddState createState() => _BusiProdAddState();
}

class _BusiProdAddState extends State<BusiProdAdd> {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController mrpTextEditingController = TextEditingController();
  TextEditingController genreTextEditingController = TextEditingController();
  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController quantityTextEditingController = TextEditingController();
  TextEditingController unitTextEditingController = TextEditingController();
  TextEditingController brandTextEditingController = TextEditingController();
  TextEditingController colorTextEditingController = TextEditingController();
  TextEditingController mfdTextEditingController = TextEditingController();
  TextEditingController expTextEditingController = TextEditingController();
  TextEditingController barcodeTextEditingController = TextEditingController();
  TextEditingController fssaiNoTextEditingController = TextEditingController();
  TextEditingController proteinsTextEditingController = TextEditingController();
  TextEditingController vitaminsTextEditingController = TextEditingController();
  TextEditingController ownerInfoTextEditingController =
      TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController ratingTextEditingController = TextEditingController();
  TextEditingController reviewersTextEditingController =
      TextEditingController();
  TextEditingController offerTextEditingController = TextEditingController();
  TextEditingController rowTextEditingController = TextEditingController();
  TextEditingController columnTextEditingController = TextEditingController();
  TextEditingController shelfTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20),
                child: Text(
                  "Enter Product Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.green),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(width: 1.5, color: Colors.grey[300])),
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.5,
                child: TextButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        MdiIcons.imageEdit,
                        size: 50,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Upload Image",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: titleTextEditingController,
                hintText: "Product Title"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: mrpTextEditingController,
                hintText: "Mrp price"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: genreTextEditingController,
                hintText: "Product Category"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: priceTextEditingController,
                hintText: "Selling Price"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: quantityTextEditingController,
                hintText: "Quantity"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: unitTextEditingController,
                hintText: "Unit[Eg. g,ml or small,medium]"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: brandTextEditingController,
                hintText: "Parent company image"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: colorTextEditingController,
                hintText: "Select matching color"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: mfdTextEditingController,
                hintText: "Manufacture Date"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: expTextEditingController,
                hintText: "Expiry Date"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: barcodeTextEditingController,
                hintText: "Product\'s barcode"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: fssaiNoTextEditingController,
                hintText: "fssai No"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: proteinsTextEditingController,
                hintText: "Enter product\'s protein content"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: vitaminsTextEditingController,
                hintText: "Enter product\'s vitamin content"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: ownerInfoTextEditingController,
                hintText: "Owner\'s name"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: phoneNumberTextEditingController,
                hintText: "Owner\'s ph.no"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: ratingTextEditingController,
                hintText: "Product rating"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: reviewersTextEditingController,
                hintText: "Reviewers of the product"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: offerTextEditingController,
                hintText: "Product offer"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: rowTextEditingController,
                hintText: "Row of the product placed"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: columnTextEditingController,
                hintText: "Column of the product placed"),
            KTextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: shelfTextEditingController,
                hintText: "Shelf of the product placed"),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RawMaterialButton(
                onPressed: () {},
                child: Container(
                  width: 100,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    "Save Data",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green[400], width: 1),
                  borderRadius: BorderRadius.circular(7),
                ),
                fillColor: Colors.lightGreen,
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkData() {
    if (titleTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the product name");
    } else if (mrpTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the actual price");
    } else if (genreTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the product category");
    } else if (priceTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the buying price");
    } else if (quantityTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the quantity of product");
    } else if (unitTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the unit of product");
    } else if (brandTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the brand of product");
    } else if (colorTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the color related to the product");
    } else if (mfdTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the mfd of the product");
    } else if (expTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the exp date of the product");
    } else if (barcodeTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the barcode of the product");
    } else if (fssaiNoTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the fssai no.");
    } else if (proteinsTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the proteins of the product");
    } else if (vitaminsTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the vitamins of the product");
    } else if (mfdTextEditingController.text.isEmpty) {
      displayToastMessage(context, "Enter the mfd of the product");
    } else {}
  }
}
