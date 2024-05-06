import 'package:flutter/material.dart';


class TextDescription extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TextDescription({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
