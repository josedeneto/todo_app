import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';
import '../../../core/strings/app_strings.dart';
import '../../../model/todo_model.dart';
import '../../../core/style/app_typography.dart';
import 'todo_tile_widget.dart';

class DismissibleWidget extends StatelessWidget {
  final TodoModel todoModel;
  final Function(DismissDirection) onDismissed;
  final Key keyTodo;
  const DismissibleWidget({
    required this.todoModel,
    required this.onDismissed,
    required this.keyTodo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
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
      onDismissed: onDismissed,
      key: Key(
        keyTodo.toString(),
      ),
      child: TodoTileWidget(
        todoModel: todoModel,
      ),
    );
  }
}
