import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/todo_model.dart';
import '../controller/home_controller.dart';

class TodoTileWidget extends StatelessWidget {
  final TodoModel todoModel;
  const TodoTileWidget({
    required this.todoModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: context.watch<HomeController>().done.contains(todoModel),
      onTap: () {
        context.read<HomeController>().doneTodo(
              todoModel,
            );
      },
      title: Text(
        todoModel.title,
      ),
      subtitle: Text(
        todoModel.dataTime,
      ),
    );
  }
}
