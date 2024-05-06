import 'package:app_todo/app/pages/home/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/add_todo/controller/add_todo_controller.dart';

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

