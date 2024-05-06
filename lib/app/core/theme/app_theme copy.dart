import 'package:app_todo/app/core/style/app_style.dart';
import 'package:app_todo/app/core/style/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/app_color.dart';

class AppThemes {
  static ThemeData get themeLightOne => ThemeData(
        textTheme: TextTheme(
            bodySmall: AppTypography.normal!.copyWith(
              color: AppColor.background,
            ),
            headlineMedium: AppTypography.boldText!.copyWith(
              color: AppColor.background,
            )),
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
            onErrorContainer: Color(0xFFffdad6)),
      );
  //darkTheme ==========================================================
  static ThemeData themeDarkOne(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          foregroundColor: AppColor.secondary,
          shadowColor: Colors.transparent,
          backgroundColor: AppColor.background,
          surfaceTintColor: AppColor.background,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light),
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                color: AppColor.tercery,
              ),
          elevation: 0,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          elevation: 0,
          enableFeedback: true,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent
        ),
        timePickerTheme: const TimePickerThemeData(
          backgroundColor: AppColor.border,
          hourMinuteColor: AppColor.hourColor,
          hourMinuteTextColor: AppColor.white,
          entryModeIconColor: AppColor.white,
          dialTextColor: AppColor.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(14),
            textStyle: AppTypography.normal!.copyWith(
              fontWeight: FontWeight.w400,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide.none,
            ),
            backgroundColor: AppColor.secondary,
            foregroundColor: AppColor.tercery,
          ),
        ),
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
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColor.hint,
                fontSize: 16,
              ),
          enabledBorder: AppStyle.defaultBorderNone,
          focusedBorder: AppStyle.defaultBorderNone,
          focusedErrorBorder: AppStyle.defaultBorderNone,
          errorBorder: AppStyle.defaultBorderNone,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          bodySmall: AppTypography.normal,
          headlineMedium: AppTypography.boldText,
        ),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          brightness: Brightness.dark,
          background: AppColor.background,
          primary: AppColor.primary,
          secondary: AppColor.secondary,
          onSecondary: const Color(0XFFcec0e7),
          onError: AppColor.red,
          errorContainer: const Color(0xff93000a),
          surface: AppColor.listTileTitle,
          tertiaryContainer: const Color(0xFF006d3f),
          outline: AppColor.hint,
          tertiary: AppColor.white,
          onSurfaceVariant: AppColor.grey,
          outlineVariant: AppColor.border,
        ),
      );
}
