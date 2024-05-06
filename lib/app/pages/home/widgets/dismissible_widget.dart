import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';
import '../../../core/strings/app_strings.dart';
import '../../../model/todo_model.dart';
import '../../../core/style/app_typography.dart';
import 'todo_tile_widget.dart';

class DismissibleWidget extends StatelessWidget {
  final TodoModel todoModel;
  final bool isDoneTodo;
  final Function() onDismissed;
  final Future<bool>Function() confirmDismiss;
  const DismissibleWidget({
    required this.todoModel,
    required this.onDismissed,
    required this.confirmDismiss,
    required this.isDoneTodo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss:(DismissDirection direction) async{
        return confirmDismiss();
      },
      key:Key(todoModel.id.toString()),
      direction: DismissDirection.horizontal,
      background: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.delete_outlined,
            color: AppColor.red.shade700,
          ),
          Text(
            AppStrings.deleteTask,
            style: AppTypography.normal!.copyWith(
              color: AppColor.red.shade700,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      
      
      onDismissed:(_){
        onDismissed();
      },
      
      child: TodoTileWidget(
        isDoneTodo: isDoneTodo,
        todoModel: todoModel,
      ),
    );
  }
}
