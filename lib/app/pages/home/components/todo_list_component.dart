import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_color.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/widgets/app_icon_widget.dart';
import '../controller/home_controller.dart';
import '../widgets/dismissible_widget.dart';
import '../widgets/title_and_filter.dart';
import 'no_tasks_component.dart';

class TodoListWidget extends StatelessWidget {
  final HomeController homeController;
  final Function() messageDeleteTodo;
  final Function() deleteAllTodo;
  final Future<bool> Function() confirmDeletTodo;

  const TodoListWidget({
    Key? key,
    required this.homeController,
    required this.confirmDeletTodo,
    required this.messageDeleteTodo,
    required this.deleteAllTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        TitleAndFilter(
          title: 'Minhas tarefas',
          filter: [
            PopupMenuItem(
              value: 1,
              height: 25,
              onTap: homeController.todos.isEmpty
                  ? null
                  : () {
                      deleteAllTodo();
                    },
              child: Text(
                'Eliminar todas',
                style: theme.textTheme.bodySmall!.copyWith(
                  color:
                      homeController.todos.isEmpty ? AppColor.textNull : null,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
          visible: homeController.todos.isEmpty,
          replacement: Consumer<HomeController>(
            builder: (_, todo, __) => Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal,
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 40),
                itemCount: todo.todos.length,
                itemBuilder: (_, index) {
                  return AnimationConfiguration.staggeredList(
                    delay: const Duration(milliseconds: 500),
                    //duration: const Duration(milliseconds: 500),
                    position: index,
                    child: SlideAnimation(
                      child: DismissibleWidget(
                        isDoneTodo: todo.done.contains(todo.todos[index]),
                        key: Key(todo.todos[index].id),
                        confirmDismiss: () async => confirmDeletTodo(),
                        onDismissed: () {
                          todo.removeAtt(todo.todos[index]);
                          messageDeleteTodo();
                        },
                        todoModel: todo.todos[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          child: const NoTasksComponent(
            image: AppIcons.noTodo,
            text: AppStrings.messageNoTodo,
          ),
        ),
      ],
    );
  }
}
