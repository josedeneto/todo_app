import 'package:flutter/material.dart';

import '../../../core/style/app_typography.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTypography.normal!.copyWith(
          fontSize: 20,
        ),
        children: [
          TextSpan(
            text: 'Quando ',
            style: AppTypography.normal!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const TextSpan(
            text: 'você\n',
          ),
          const TextSpan(
            text: 'vai fazer a sua tarefa?',
          )
        ],
      ),
    );
  }
}
