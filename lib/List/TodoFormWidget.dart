import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop/Constants.dart';

class TodoFormWidget extends StatelessWidget {
  final String prodName;
  final String quantity;
  ValueChanged<String> onChangeProdName;
  ValueChanged<String> onChangeQuantity;
  final VoidCallback onSaved;

  TodoFormWidget({
    this.prodName,
    this.quantity,
    this.onChangeProdName,
    this.onChangeQuantity,
    this.onSaved,
  });

  TextEditingController _quantity = new TextEditingController();
  GlobalKey _key = GlobalKey<AutoCompleteTextFieldState<product>>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: TextFormField(
            initialValue: prodName,
            onChanged: onChangeProdName,
            decoration: InputDecoration(
                labelText: "Product Name",
                labelStyle: TextStyle(fontSize: 18, color: Colors.green),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green[700],
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green[700],
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextFormField(
            initialValue: quantity,
            onChanged: onChangeQuantity,
            decoration: InputDecoration(
                labelText: "Quantity",
                labelStyle: TextStyle(fontSize: 18, color: Colors.green),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green[700],
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green[700],
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green))),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: RawMaterialButton(
            onPressed: onSaved,
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            fillColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//   child: TextFormField(
//     initialValue: prodName,
//     onChanged: onChangeProdName,
//     decoration: InputDecoration(
//         labelText: "Product Name",
//         labelStyle: TextStyle(fontSize: 18, color: Colors.green),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.green[700],
//             width: 1,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.green[700],
//             width: 1,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(width: 2, color: Colors.green))),
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//   child: TextFormField(
//     initialValue: quantity,
//     onChanged: onChangeQuantity,
//     decoration: InputDecoration(
//         labelText: "Quantity",
//         labelStyle: TextStyle(fontSize: 18, color: Colors.green),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.green[700],
//             width: 1,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.green[700],
//             width: 1,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(width: 2, color: Colors.green))),
//   ),
// ),
// Padding(
//   padding: EdgeInsets.only(top: 10),
//   child: RawMaterialButton(
//     onPressed: onSaved,
//     child: Text(
//       "Add",
//       style: TextStyle(color: Colors.white, fontSize: 16),
//     ),
//     fillColor: Colors.red,
//     shape:
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//   ),
// )
