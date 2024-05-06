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
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
               fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: ' ${AppStrings.you}\n',
            style:  Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: AppStrings.doTheTask,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
