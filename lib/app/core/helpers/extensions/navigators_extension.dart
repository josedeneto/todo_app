import 'package:flutter/material.dart';

extension NavigatorExtends on BuildContext {
  Future<dynamic> pushNamed(String page) async{
    return Navigator.pushNamed(this, page);
  }

  void pop(Widget page, [result])async{
    return Navigator.of(this).pop(result);
  }
}
