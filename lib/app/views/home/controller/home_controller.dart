import 'package:app_todo/app/model/todo_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{
  List<TodoModel> done = [];

  doneTodo(TodoModel todoModel){
    done.add(todoModel);
    notifyListeners();
  }

}
