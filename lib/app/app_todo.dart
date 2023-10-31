import 'package:app_todo/app/utils/bindings/app_binding.dart';
import 'package:app_todo/app/utils/theme/app_theme.dart';
import 'package:app_todo/app/views/settings/settings.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'views/add_todo/add_todo_page.dart';
import 'views/home/home_page.dart';

class AppTodo extends StatelessWidget {
  const AppTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'PT')],
        home: const Scaffold(
          body: HomePage(),
        ),
        theme: AppTheme.theme,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/add_todo': (context) => const AddTodoPage(),
          '/settings': (context) => const SettingsPage()
        },
      ),
    );
  }
}
