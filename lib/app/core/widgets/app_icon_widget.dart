
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

 const String path = 'assets/images/';
class AppIcons {
 
 static const noTodo = '${path}0.svg';
 static const noTodoe = '${path}1.svg';
 static const noTodoee = '${path}2.svg';
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
      width: size?.width ?? 100,
      height: size?.height ?? 100,
    );
  }
}
