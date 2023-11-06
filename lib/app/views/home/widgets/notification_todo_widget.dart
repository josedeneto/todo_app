import 'package:app_todo/app/views/add_todo/widget/todo_container.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';
import '../../../core/style/app_typography.dart';

class NotificationTodoWidget extends StatelessWidget {
  const NotificationTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoContainer(
      child: Column(
        children: [
          Text(
            'A tua tarefa começará em',
            style: AppTypography.normal,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '09 min e 33 seg',
            style: AppTypography.boldText!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 19,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.sizeOf(context).width,
            height: 140,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
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
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Estudar Flutter',
                      style: AppTypography.boldText!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '9h:30 min até 10:39',
                  style: AppTypography.normal!.copyWith(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
