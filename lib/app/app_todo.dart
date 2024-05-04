import 'package:app_todo/app/core/theme/other.dart';
import 'package:app_todo/app/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/bindings/app_binding.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';


class AppTodo extends StatelessWidget {
  const AppTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBinding(
      child: Builder(
        builder:(context){
          final materialApp = MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [Locale('pt', 'PT')],
          //darkTheme: ThemeData(colorScheme: darktheme),
          theme:context.watch<HomeController>().isDarkMode? AppTheme.theme:AppTheme.themeLight,
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes,);
        
        return materialApp;
    }
    ));
  }
}
