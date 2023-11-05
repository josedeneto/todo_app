import 'package:flutter/material.dart';

mixin Validator<T extends StatefulWidget> on State<T> {
  String? validatorTodo(String? value) {
    if (value == null || value.isEmpty) {
      return "Por favor adicione uma tarefa";
    } else if (value.length < 3) {
      return 'A tarefa deve conter mais de 4 dígitos';
    }
    return null;
  }
}
