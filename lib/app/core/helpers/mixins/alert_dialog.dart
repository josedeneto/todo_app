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
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
              ),
            ),
            TextButton(
              onPressed: function,
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  Future<bool> showAlertConfirmDeleteUniqueTodo() async {
    bool shouldDismiss = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar tarefa'),
        content: const Text('Tem certeza que quer eliminar esta tarefa?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:  Text('Cancelar',style: TextStyle(color: Theme.of(context).colorScheme.errorContainer)),
          ),
          TextButton(
            onPressed: () {
              return Navigator.of(context).pop(true);
            },
            child: const Text('Sim'),
          ),
        ],
      ),
    );
    return shouldDismiss;
  }
}
