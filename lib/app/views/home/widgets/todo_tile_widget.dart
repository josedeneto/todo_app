import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
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
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            todoModel.time,
            style: AppTypography.normal!.copyWith(
              fontSize: 26,
            ),
          ),
          const SizedBox(width: 20,),
          Container(
            width: 30,
            height: 30,
            decoration: const  BoxDecoration(
              color: AppColor.todoCircle,
              shape: BoxShape.circle,),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                 decoration: const BoxDecoration(
              color: AppColor.white,
              shape: BoxShape.circle,),
              ),
            ),
          ),
         Container(
          margin:EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: 15,
          height: 1,
          decoration: BoxDecoration(
            color: AppColor.grey.withOpacity(0.4)
          ),
         )
        ],
      ),
      title: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColor.listTileTitle,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todoModel.title, style: AppTypography.boldText!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
        todoModel.dataTime,
        style: AppTypography.normal!.copyWith(
               color: AppColor.grey ,
              )
            ),
          ],
        ),
      ),
      selected: context.watch<HomeController>().done.contains(todoModel),
      onTap: () {
        context.read<HomeController>().doneTodo(
              todoModel,
            );
      },
    );
  }
}
