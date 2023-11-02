import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/app_style.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        hintColor: AppColor.hint,
        textTheme: TextTheme(
          bodySmall: AppTypography.normal,
          bodyMedium: AppTypography.normal,
        ),
        useMaterial3: true,
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.only(left: 0),
          leadingAndTrailingTextStyle: AppTypography.normal,
          minLeadingWidth: 1,
          horizontalTitleGap: 5,
          titleTextStyle: AppTypography.normal,
          selectedColor: AppColor.selectedColor,
          selectedTileColor: AppColor.selectTile,
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
          checkmarkColor: AppColor.white,
          disabledColor: AppColor.background,
          labelStyle: AppTypography.boldText!.copyWith(
            fontSize: 16,
          ),
        ),
        dialogTheme: DialogTheme(
          titleTextStyle: AppTypography.boldText!.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
          contentTextStyle: AppTypography.normal,
          backgroundColor: AppColor.border,
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColor.border,
          dividerColor: AppColor.grey,
          headerBackgroundColor: AppColor.secondary,
          weekdayStyle: const TextStyle(color: AppColor.white),
        ),
        timePickerTheme: const TimePickerThemeData(
            backgroundColor: AppColor.border,
            hourMinuteColor: AppColor.hourColor,
            hourMinuteTextColor: AppColor.white,
            entryModeIconColor: AppColor.white,
            dialTextColor: AppColor.white,
            ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColor.textField,
          errorBorder: AppStyle.errorBorder,
          isDense: true,
          border: AppStyle.defaultBorder,
          focusedBorder: AppStyle.focusedBorder,
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: AppColor.white,
          titleTextStyle: AppTypography.normal!.copyWith(
            fontSize: 18,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          iconTheme: const IconThemeData(
            color: AppColor.secondary,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          disabledElevation: 0,
          backgroundColor: AppColor.secondary,
          elevation: 0,
          foregroundColor: AppColor.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(14),
              backgroundColor: AppColor.secondary,
              foregroundColor: AppColor.white),
        ),
        dividerTheme: const DividerThemeData(
          thickness: 1,
          color: AppColor.border,
        ),
      );
}
