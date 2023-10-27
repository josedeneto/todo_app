import 'package:app_todo/app/utils/theme/app_theme.dart';
import 'package:app_todo/app/views/home/controller/home_controller.dart';
import 'package:app_todo/app/views/settings/settings.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/add_todo/add_todo_page.dart';
import 'views/home/home_page.dart';


class AppTodo extends StatelessWidget {
  const AppTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: HomePage(),
        ),
        theme: AppTheme.theme,
        initialRoute: '/settings',
        routes: {
          '/home': (context) => const HomePage(),
          '/add_todo': (context) => const AddTodoPage(),
          '/settings':(context) =>  const SettingsPage()
        },
      ),
    );
  }
}
