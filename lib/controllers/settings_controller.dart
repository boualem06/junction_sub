import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  bool adBlocker = true;
  double maxAmmount = 1500;

  changeAmmount(double newAmmount) {
    maxAmmount = newAmmount;
    notifyListeners();
  }

  changeAd(bool value) {
    adBlocker = value;
    notifyListeners();
  }
}
