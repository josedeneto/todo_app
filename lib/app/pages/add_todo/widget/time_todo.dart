import 'package:flutter/material.dart';
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
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
          ),
          inputTime
        ],
      ),
    );
  }
}
