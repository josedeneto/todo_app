import 'package:app_todo/app/model/todo_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<TodoModel> done = [];
  List<TodoModel> todos = [];
  bool isSelected = true;

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

  void removeAllTodo() {
    todos.clear();
    notifyListeners();
  }

  void removeTodo(TodoModel todoModel) {
    if (todos.contains(todoModel) || done.contains(todoModel)) {
      todos.remove(todoModel);
      done.remove(todoModel);
    }
    notifyListeners();
  }

  void toggleChip(bool value) {
    if (isSelected) {
      isSelected = !value;
    } else {
      isSelected = value;
    }
    notifyListeners();
  }
}
