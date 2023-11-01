import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:flutter/material.dart';

mixin AlertsDialog<T extends StatefulWidget> on State<T> {
  showAlert(VoidCallback function) {
    showAdaptiveDialog(
      context: context,
      builder: (_) {
        return AlertDialog.adaptive(
          title:  Text('Remover todas as tarefas',style: AppTypography.boldText!.copyWith(color: AppColor.white),),
          content:
               Text('Tem a certeza que quer remover todas as tarefas', style: AppTypography.normal,),
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
