import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grocery_shop/List/Todo.dart';
import 'package:grocery_shop/Validate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  TodoWidget({this.todo});

  @override
  Widget build(BuildContext context) {
    void deleteTodo() {
      final provider = Provider.of<Validate>(context, listen: false);
      provider.deleteTodo(todo);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          secondaryActions: [
            IconSlideAction(
              icon: MdiIcons.delete,
              color: Colors.red,
              onTap: deleteTodo,
            )
          ],
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            color: Colors.grey[200],
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Checkbox(
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<Validate>(context, listen: false);
                  final isDone = provider.toggleIsDone(todo);
                },
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                child: Text(
                  "${todo.prodName}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationStyle: TextDecorationStyle.double
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text("${todo.quantity.isEmpty?'':'Qty:'} ${todo.quantity}",style: TextStyle(fontSize: 18),)
            ]),
          ),
        ),
      ),
    );
  }
}
