import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';

class TodoContainer extends StatelessWidget {
  final Widget child;
  final bool? isActiveBorder;
  final bool? isEmptyTodo;
  final bool? isDarkMode;
  const TodoContainer({
    Key? key,
    required this.child,
    this.isActiveBorder,
    this.isEmptyTodo,
    this.isDarkMode = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color borderColor = isActiveBorder == true
        ? AppColor.primary
        : (isEmptyTodo == true ? AppColor.red : Colors.transparent);
    final List<BoxShadow> boxShadow = isDarkMode!
        ? [
            BoxShadow(
              color: AppColor.border.withOpacity(0.8),
              blurRadius: 1.0,
              spreadRadius: 1.0,
            ),
          ]
        : [const BoxShadow(spreadRadius: 0.2)];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 0.50,
        ),
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.background,
      ),
      child: child,
    );
  }
}
