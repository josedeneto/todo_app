import 'package:flutter/material.dart';

extension NavigatorExtends on BuildContext {
  Future<dynamic> pushNamed({required String page}) async{
     Navigator.pushNamed(this, page);
  }

  void pop(Widget page, [result])async{
    return Navigator.of(this).pop(result);
  }
}
