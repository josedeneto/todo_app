import 'package:flutter/material.dart';
import '../../../model/todo_model.dart';

class AddTodoController extends ChangeNotifier {
  List<TodoModel> todos = [];

  addTodo(TodoModel todoModel) {
    todos.add(todoModel);
    notifyListeners();
  }
}
