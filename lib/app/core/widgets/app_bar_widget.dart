import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  final bool implyLeading;

  AppBarWidget(
      {super.key,
      required super.title,
      this.implyLeading = true,
      super.actions})
      : super(
          automaticallyImplyLeading: implyLeading,
        );
}
