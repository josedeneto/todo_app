import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  bool onNotify = true;

  void changeNotification(value) {
    onNotify = value;
    notifyListeners();
  }
}
