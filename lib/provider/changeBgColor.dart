import 'package:flutter/material.dart';

class ChangeColor extends ChangeNotifier {
  Color color = Colors.white;

  ChangeColor({
    this.color = Colors.white,
  });

  void changedColor({
    required Color newBgColor,
  }) async {
    color = newBgColor;
    notifyListeners();
  }
}
