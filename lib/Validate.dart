import 'package:flutter/material.dart';
import 'package:grocery_shop/List/Todo.dart';

class Validate extends ChangeNotifier {
  bool _isLocal = false;

  void trueValidation() {
    _isLocal = true;
  }

  void falseValidation() {
    _isLocal = false;
  }
  bool get isLocal => _isLocal;


  List<Todo> _todos = [
  ];

  List<Todo> get todos => _todos.toList();

  void addTodo(Todo todo){
    _todos.add(todo);
    notifyListeners();
  }

  void toggleIsDone(Todo todo){
    todo.isDone = !todo.isDone;
    notifyListeners();
  }

  void deleteTodo(Todo todo){
    _todos.remove(todo);
    notifyListeners();
  }
}
