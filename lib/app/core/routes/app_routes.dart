import 'package:app_todo/app/views/add_todo/add_todo_page.dart';
import 'package:app_todo/app/views/home/home_page.dart';
import 'package:app_todo/app/views/settings/settings.page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String addTodo = '/add_todo';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomePage(),
        addTodo: (context) => const AddTodoPage(),
        settings: (context) => const SettingsPage(),
      };
}
