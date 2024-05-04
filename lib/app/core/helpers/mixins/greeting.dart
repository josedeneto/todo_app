import 'package:flutter/material.dart';

mixin Greeting<T extends StatefulWidget> on State<T> {
  String greeting(String formatedTime) {
    final hora = int.parse(formatedTime.split(':')[0]);
    switch (hora) {
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
        return 'Bom dia!';
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
        return 'Boa tarde!';
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
        return 'Boa noite!';
      default:
        return 'Olá';
    }
  }
}
