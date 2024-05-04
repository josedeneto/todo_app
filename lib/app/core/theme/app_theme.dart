import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/app_color.dart';
import '../style/app_style.dart';
import '../style/app_typography.dart';

class AppTheme {
  static ThemeData get themeLight => ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        hintColor: AppColor.grey,
        brightness: Brightness.dark,
        switchTheme:const SwitchThemeData(),
        textTheme: TextTheme(
          bodySmall: AppTypography.normal!.copyWith(color: AppColor.background),
          bodyMedium:
              AppTypography.normal!.copyWith(color: AppColor.background),
        ),
        useMaterial3: true,
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.only(left: 2, right: 6),
          leadingAndTrailingTextStyle: AppTypography.normal,
          minLeadingWidth: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(12),
          ),
          horizontalTitleGap: 0,
          titleTextStyle: AppTypography.normal,
          selectedColor: AppColor.red,
          selectedTileColor: AppColor.trackSwitch,
        ),
        chipTheme: const ChipThemeData(
          selectedColor: AppColor.secondary,
          checkmarkColor: AppColor.white,
          backgroundColor: AppColor.background,
        ),
        dialogTheme: DialogTheme(
          titleTextStyle: AppTypography.boldText!.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
          contentTextStyle: AppTypography.normal,
          backgroundColor: AppColor.trackSwitch,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          elevation: 0,
          enableFeedback: true,
          color: AppColor.chips,
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              color: AppColor.white,
            ),
          ),
        ),
        timePickerTheme: const TimePickerThemeData(
          backgroundColor: Color.fromARGB(255, 90, 63, 151),
          hourMinuteColor: AppColor.hourColor,
          hourMinuteTextColor: AppColor.white,
          entryModeIconColor: AppColor.white,
          dialTextColor: AppColor.white,
          dialBackgroundColor: AppColor.hourColor,
          helpTextStyle: TextStyle(color: AppColor.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.orangeAccent,
          errorBorder:
              AppStyle.errorBorder.copyWith(borderSide: BorderSide.none),
          isDense: true,
          border: AppStyle.defaultBorder,
          focusedBorder: AppStyle.defaultBorder,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          foregroundColor: AppColor.background,
          titleTextStyle: AppTypography.normal!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.background),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColor.white,
            statusBarBrightness: Brightness.dark,
          ),
          iconTheme: const IconThemeData(
            color: AppColor.secondary,
          ),
          backgroundColor: AppColor.white,
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
            elevation: 1,
            textStyle: AppTypography.normal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: AppColor.secondary,
            foregroundColor: AppColor.white,
          ),
        ),
        dividerTheme: const DividerThemeData(
          thickness: 1,
          color: AppColor.border,
        ),
      );
  //darkTheme ==========================================================
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        hintColor: AppColor.hint,
        textTheme: TextTheme(
          bodySmall: AppTypography.normal,
          bodyMedium: AppTypography.normal,
        ),
        useMaterial3: true,
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.only(left: 2, right: 6),
          leadingAndTrailingTextStyle: AppTypography.normal,
          minLeadingWidth: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(12),
          ),
          horizontalTitleGap: 0,
          titleTextStyle: AppTypography.normal,
          selectedColor: AppColor.selectedColor,
          selectedTileColor: AppColor.selectTile,
        ),
        chipTheme: const ChipThemeData(
          selectedColor: AppColor.secondary,
          checkmarkColor: AppColor.white,
          backgroundColor: AppColor.background,
        ),
        dialogTheme: DialogTheme(
          titleTextStyle: AppTypography.boldText!.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
          contentTextStyle: AppTypography.normal,
          backgroundColor: AppColor.border,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          elevation: 0,
          enableFeedback: true,
          color: AppColor.border,
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              color: AppColor.white,
            ),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColor.border,
          dividerColor: AppColor.grey,
          dayForegroundColor: const MaterialStatePropertyAll(AppColor.white),
          dayOverlayColor:
              const MaterialStatePropertyAll(AppColor.dayOverlayColor),
          headerForegroundColor: AppColor.white,
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
          fillColor: AppColor.background,
          errorBorder:
              AppStyle.errorBorder.copyWith(borderSide: BorderSide.none),
          isDense: true,
          border: AppStyle.defaultBorder,
          focusedBorder: AppStyle.defaultBorder,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          foregroundColor: AppColor.white,
          titleTextStyle: AppTypography.normal!.copyWith(
            fontSize: 16,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light
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
            elevation: 1,
            textStyle: AppTypography.normal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: AppColor.secondary,
            foregroundColor: AppColor.white,
          ),
        ),
        dividerTheme: const DividerThemeData(
          thickness: 1,
          color: AppColor.border,
        ),
      );
}
