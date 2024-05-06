import 'package:flutter/material.dart';
import 'app/app_todo.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('pt_pt',timeago.PtBrMessages());
  runApp(const AppTodo());
}
