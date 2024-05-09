import 'dart:math';

import 'package:app_todo/app/core/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/todo_model.dart';
import '../controller/home_controller.dart';
import 'mark_done_todo.dart';

class TodoTileWidget extends StatelessWidget {
  final TodoModel todoModel;
  final VoidCallback? onTap;
  final bool isDoneTodo;
  final List<Color> color = [
    AppColor.todoCircle,
    AppColor.primary,
  ];
  final Random sort = Random();
  TodoTileWidget({
    required this.todoModel,
    required this.isDoneTodo,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = context.watch<HomeController>();
    final theme = Theme.of(context).textTheme;
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            todoModel.time,
            style: theme.bodySmall!.copyWith(
                fontSize: 20,
                color: homeController.isDarkMode
                    ? AppColor.white
                    : AppColor.background),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color[sort.nextInt(color.length)],
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: 15,
            height: 1,
            decoration: BoxDecoration(
              color: AppColor.grey.withOpacity(0.4),
            ),
          )
        ],
      ),
      title: Container(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: AppColor.listTileTitle,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeController.done.contains(todoModel)
                ? const MarkDoneTodo()
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todoModel.title,
                  style: theme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color:
                        homeController.isDarkMode ? null : AppColor.background,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: AppColor.hint,
                  size: 16,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(todoModel.dataTime,
                    style: theme.bodySmall!.copyWith(
                      fontSize: 13,
                      color: AppColor.hint,
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.access_time_outlined,
                    color: AppColor.hint, size: 16),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  todoModel.createdAt,
                  style: theme.bodySmall!.copyWith(
                    fontSize: 13,
                    color: AppColor.hint,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        homeController.doneTodo(
          todoModel,
        );
      },
    );
  }
}
