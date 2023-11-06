import 'package:app_todo/app/core/strings/app_strings.dart';
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
            text: AppStrings.when,
            style: AppTypography.normal!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const TextSpan(
            text: ' ${AppStrings.you}\n',
          ),
          const TextSpan(
            text: AppStrings.doTheTask,
          )
        ],
      ),
    );
  }
}
