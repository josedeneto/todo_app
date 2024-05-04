import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

mixin MessageValidator<T extends StatefulWidget> on State<T> {
  void messageSucessTodo() {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.topCenter,
      dismissDirection: DismissDirection.up,
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.none,
      title: const Text('Tarefa criada com sucesso'),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  void messageDeleteTodo() {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.topCenter,
      dismissDirection: DismissDirection.up,
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.none,
      title: const Text('Tarefa eliminada com sucesso'),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  void messageDeleteAllTodo() {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.topCenter,
      dismissDirection: DismissDirection.up,
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.none,
      title: const Text('Tarefas eliminadas com sucesso'),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}


