import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/List/Todo.dart';
import 'package:grocery_shop/List/TodoFormWidget.dart';
import 'package:grocery_shop/List/TodoListWidget.dart';
import 'package:grocery_shop/Validate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class GroceryList extends StatefulWidget {
  static const id = "GroceryList";

  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  String prodName = "";
  String quantity = "";

  Widget buildDialog(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(children: [
              Text(
                "Add Items",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TodoFormWidget(
                onChangeProdName: (name)=>setState(()=>this.prodName=name,),
                onChangeQuantity: (quantity)=> setState(()=>this.quantity = quantity,),
                onSaved: addTodo,
              )
            ]),
          )),
    );
  }

  void addTodo() {
    final todo = Todo(
      prodName: prodName,
      quantity: quantity,
    );
    final provider = Provider.of<Validate>(context,listen: false);
    provider.addTodo(todo);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          MdiIcons.plus,
          size: 25,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: buildDialog,
              barrierDismissible: false);
        },
      ),
      backgroundColor: Colors.green[600],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Grocery List",
                style: GoogleFonts.satisfy(
                  fontSize: 45,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1, blurRadius: 10, color: Colors.grey)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: TodoListWidget(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
