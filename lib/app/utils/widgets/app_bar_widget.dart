import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends AppBar {
  final bool implyLeading;

  AppBarWidget({super.key, required super.title, this.implyLeading = true, super.actions})
      : super(
          automaticallyImplyLeading: implyLeading,
          foregroundColor: AppColor.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        );
}
