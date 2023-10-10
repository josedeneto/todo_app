import 'package:flutter/material.dart';

mixin MessageValidator<T extends StatefulWidget> on State<T> {
  messageValidator() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Tarefa adicionada com sucesso',
        ),
        action: SnackBarAction(
          label: 'Cancelar',
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 2,
        ),
      ),
    );
  }
}
