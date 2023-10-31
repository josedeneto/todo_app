import 'package:app_todo/app/model/todo_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<TodoModel> done = [];
  List<TodoModel> todos = [];

  addTodo(TodoModel todoModel) {
    todos.add(todoModel);
    notifyListeners();
  }

  doneTodo(TodoModel todoModel) {
    if (done.contains(todoModel)) {
      done.remove(todoModel);
    } else {
      done.add(todoModel);
    }
    notifyListeners();
  }
}
