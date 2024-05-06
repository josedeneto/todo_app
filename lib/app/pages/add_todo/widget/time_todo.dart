import 'package:flutter/material.dart';


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
    final theme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: theme.bodySmall!.copyWith(fontSize: 12),
          ),
          inputTime
        ],
      ),
    );
  }
}
