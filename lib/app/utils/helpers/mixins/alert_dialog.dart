import 'package:flutter/material.dart';

mixin AlertsDialog<T extends StatefulWidget> on State<T> {
  showAlert(VoidCallback function) {
    showAdaptiveDialog(
      context: context,
      builder: (_) {
        return AlertDialog.adaptive(
          title: const Text(
            'Remover todas as tarefas',
          ),
          content: const Text(
            'Tem a certeza que quer remover todas as tarefas?',
          ),
          actions: [
            TextButton(
              onPressed: function,
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Não'),
            )
          ],
        );
      },
    );
  }
}
