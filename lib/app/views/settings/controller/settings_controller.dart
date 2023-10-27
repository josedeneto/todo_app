import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier{
  var onNotify = true;

  changeNotification(bool value){
    onNotify = value;
    notifyListeners();
  }
}