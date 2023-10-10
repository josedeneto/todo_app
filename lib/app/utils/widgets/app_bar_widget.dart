import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends AppBar {
  final bool implyLeading;

  AppBarWidget({super.key, required super.title, this.implyLeading = true, super.actions})
      : super(
          automaticallyImplyLeading: implyLeading,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            
          ),
        );
}
