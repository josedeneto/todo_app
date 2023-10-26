import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:flutter/material.dart';

import '../style/app_style.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        hintColor: AppColor.hint,
        textTheme: TextTheme(
          bodySmall: AppTypography.normal,
          bodyMedium: AppTypography.normal,
        ),
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.only(left: 0),
          leadingAndTrailingTextStyle: AppTypography.normal,
          minLeadingWidth: 1,
          horizontalTitleGap: 5,
          titleTextStyle: AppTypography.normal,
        ),
        snackBarTheme: const SnackBarThemeData(
          actionTextColor: AppColor.secondary,
          backgroundColor: AppColor.textField,
          contentTextStyle: TextStyle(
            color: AppColor.white,
          ),
        ),
        chipTheme: ChipThemeData(
          selectedColor: AppColor.secondary,
          disabledColor: AppColor.background,
          labelStyle: AppTypography.boldText!.copyWith(
            fontSize: 16,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColor.textField,
          errorBorder: AppStyle.errorBorder,
          isDense: true,
          border: AppStyle.defaultBorder,
          focusedBorder: AppStyle.focusedBorder,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColor.secondary,
          ),
          color: AppColor.background,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          disabledElevation: 0,
          backgroundColor: AppColor.secondary,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(14),
            backgroundColor: AppColor.secondary,
          ),
        ),
        dividerTheme: const DividerThemeData(
          thickness: 1,
          color: AppColor.border,
        ),
      );
}
