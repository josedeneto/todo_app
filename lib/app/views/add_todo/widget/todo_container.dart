import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';

class TodoContainer extends StatelessWidget {
  final Widget child;
  const TodoContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.border.withOpacity(0.8),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          )
        ],
        borderRadius: BorderRadius.circular(12),
        color: AppColor.background,
      ),
      child: child,
    );
  }
}
