import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class AppStyle {
  static InputBorder defaultBorderNone = const OutlineInputBorder(borderSide: BorderSide.none);
  static InputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: AppColor.red,
      style: BorderStyle.solid,
      width: 1,
    ),
  );

  static InputBorder errorBorderTodo = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(5),
  );

  static InputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: AppColor.secondary,
      style: BorderStyle.solid,
      width: 1,
    ),
  );

  static InputBorder defaultBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(5),
  );
}
