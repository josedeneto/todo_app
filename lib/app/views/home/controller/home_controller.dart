import 'package:app_todo/app/model/todo_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<TodoModel> done = [];
  List<TodoModel> todos = [];

  void addTodo(TodoModel todoModel) {
    todos.add(todoModel);
    notifyListeners();
  }

  void doneTodo(TodoModel todoModel) {
    if (done.contains(todoModel)) {
      done.remove(todoModel);
    } else {
      done.add(todoModel);
    }
    notifyListeners();
  }

  void removeTodo(TodoModel todoModel) {
    todos.remove(todoModel);
    if (todos.contains(todoModel) && done.contains(todoModel)) {
      todos.remove(todoModel);
    }
    notifyListeners();
  }
}
