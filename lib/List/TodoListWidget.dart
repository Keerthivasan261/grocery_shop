import 'package:flutter/material.dart';
import 'package:grocery_shop/List/TodoWidget.dart';
import 'package:grocery_shop/Validate.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Validate>(context);
    final todos = provider.todos;
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final todo = todos[index];
            return todos.isEmpty
                ? Center(
                    child: Text(
                      "Add Products",
                      style: TextStyle(fontSize: 23),
                    ),
                  )
                : TodoWidget(todo: todo);
          },
          separatorBuilder: (context, i) => Container(
                height: 15,
              ),
          itemCount: todos.length),
    );
  }
}
