
import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';

class TodoContainer extends StatelessWidget {
  final Widget child;
  final bool? isActiveborder;
  final bool? isEmptyTodo;
  final bool? isDarkmode;
  const TodoContainer({Key? key, required this.child, this.isActiveborder, this.isEmptyTodo, this.isDarkmode=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isActiveborder == true? AppColor.primary : (isEmptyTodo==true?AppColor.red:Colors.transparent
           ),
          width: 0.50,
        ),
        boxShadow: [
        isDarkmode!?  BoxShadow(
            color: AppColor.border.withOpacity(0.8),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ):const BoxShadow( 
            spreadRadius: 0.2)
        ],
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.background,
      ),
      child: child,
    );
  }
}
