import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/app_icon_widget.dart';
import '../controller/home_controller.dart';
import '../widgets/title_and_filter.dart';
import '../widgets/todo_tile_widget.dart';
import 'no_tasks_component.dart';

class TaskCompleted extends StatelessWidget {
  final HomeController homeController;
  final Function deleteAllTodo;
  const TaskCompleted({
    Key? key,
    required this.homeController,
    required this.deleteAllTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        TitleAndFilter(
          title: 'Tarefas feitas',
          filter: [
            PopupMenuItem(
              height: 25,
              value: 1,
              child: const Text(
                'Eliminar todas',
              ),
              onTap: () {
                deleteAllTodo();
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
          visible: homeController.done.isEmpty,
          replacement: Consumer<HomeController>(
            builder: (_, done, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: done.done.length,
                  itemBuilder: (_, d) {
                    return TodoTileWidget(
                      isDoneTodo: done.done.contains(done.done[d]),
                      todoModel: done.done[d],
                    );
                  },
                ),
              );
            },
          ),
          child: const NoTasksComponent(
            image: AppIcons.noTodoee,
            text: 'Sem tarefas concluídas',
          ),
        ),
      ],
    );
  }
}
