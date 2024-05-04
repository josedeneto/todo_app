import 'package:app_todo/app/core/style/app_typography.dart';
import 'package:flutter/material.dart';


import '../colors/app_color.dart';

class AppTheme {
  static ThemeData get themeLight => ThemeData(
    textTheme: TextTheme(
      bodySmall: AppTypography.normal!.copyWith(color: AppColor.background,),
      headlineMedium: AppTypography.boldText!.copyWith(color: AppColor.background,)
    ),
    chipTheme: const ChipThemeData(
          selectedColor: AppColor.secondary,
          checkmarkColor: AppColor.white,
          backgroundColor: AppColor.background,
        ),
        colorScheme: const ColorScheme.light(
          background: AppColor.white,
          brightness: Brightness.light,
          primary: AppColor.primary,
          secondary: AppColor.secondary,
          error: AppColor.red,
          secondaryContainer: Color(0xFFa497bc),
          tertiary: Color(0xFF006d3f),
          tertiaryContainer: Color(0xFF42d086),
          onError: Color(0xFFba1a1a),
          surface: Color(0xFFded7e4),
          outline: AppColor.hint,
          onErrorContainer: Color(0xFFffdad6)  
        ),
      );
  //darkTheme ==========================================================
  static ThemeData get theme => ThemeData(
    textTheme:TextTheme( bodySmall:AppTypography.normal,
      headlineMedium: AppTypography.boldText,),
     brightness: Brightness.light,
        colorScheme: const ColorScheme.dark(
          background: AppColor.background,
          primary: AppColor.primary,
          secondary: AppColor.secondary,
          onSecondary: Color(0XFFcec0e7),
          errorContainer: Color(0xff93000a),
          surface: AppColor.listTileTitle,
          tertiary: Color(0xFF006d3f),
          tertiaryContainer: Color(0xFF42d086),
          outline: AppColor.hint

        )
      );
}
