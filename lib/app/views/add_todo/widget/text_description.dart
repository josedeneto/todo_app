import 'package:flutter/material.dart';

import '../../../core/style/app_typography.dart';

class TextDescription extends StatelessWidget {
  final String text;
  const TextDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.normal!.copyWith(
        fontSize: 14,
      ),
    );
  }
}