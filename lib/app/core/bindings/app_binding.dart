import 'package:app_todo/app/views/home/controller/home_controller.dart';
import 'package:app_todo/app/views/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../views/add_todo/controller/add_todo_controller.dart';

class AppBinding extends StatelessWidget {
  final Widget child;
  const AppBinding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
      ChangeNotifierProvider<HomeController>(create: (_) => HomeController(),),
      ChangeNotifierProvider<SettingsController>(create: (_) => SettingsController(),),
      ChangeNotifierProvider<AddTodoController>(create: (_) => AddTodoController(),),
      ], 
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: child,
      ),
    );
  }
}

