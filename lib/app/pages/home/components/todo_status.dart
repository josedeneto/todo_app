import 'package:flutter/material.dart';

import '../../../utils/style/app_typography.dart';

class TodoStatus extends StatelessWidget {
  const TodoStatus({
    super.key,
    required this.todos,
    required this.status
  });

  final List<String> todos;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: '${todos.length} ',
          style: AppTypography.normal,
        ),
        TextSpan(
          text: 'Tarefas ',
          style: AppTypography.normal,
        ),
        TextSpan(
          text: status,
          style: AppTypography.boldText,
        ),
      ]),
    );
  }
}