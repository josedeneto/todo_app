// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/style/app_typography.dart';
import 'text_description.dart';

class TimeTodo extends StatelessWidget {
  final Widget inputTime;
  final String text;
  const TimeTodo({
    Key? key,
    required this.inputTime,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextDescription(
            text: text,
            style: AppTypography.normal!.copyWith(
              fontSize: 12,
            ),
          ),
          inputTime
        ],
      ),
    );
  }
}
