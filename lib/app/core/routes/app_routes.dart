import 'package:app_todo/app/views/add_todo/add_todo_page.dart';
import 'package:app_todo/app/views/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../views/splash/splash_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String addTodo = '/add_todo';
  static const String settings = '/settings';
  static const String splash = '/splash';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomePage(),
        addTodo: (context) => const AddTodoPage(),
        splash: (context) => const SplashScreen()
      };
}
