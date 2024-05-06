import 'package:app_todo/app/core/strings/app_strings.dart';
import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Text.rich(
      TextSpan(
        style: theme.bodySmall!.copyWith(
          fontSize: 20,
        ),
        children: [
          TextSpan(
            text: AppStrings.when,
            style: theme.bodySmall!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: ' ${AppStrings.you}\n',
            style: theme.bodySmall,
          ),
          TextSpan(
            text: AppStrings.doTheTask,
            style: theme.bodySmall,
          )
        ],
      ),
    );
  }
}
