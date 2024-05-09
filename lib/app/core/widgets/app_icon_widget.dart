import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String path = 'assets/images/';

class AppIcons {
  static const noTodo = '${path}no_todo.svg';
  static const noTodoCompleted = '${path}no_todo_completed.svg';
  static const logo =  'assets/images/tm_logo.png';
}

class AppIconWidget extends StatelessWidget {
  final String icon;
  final Size? size;
  const AppIconWidget({
    Key? key,
    required this.icon,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: size?.width ?? 85,
      height: size?.height ?? 85,
    );
  }
}
