import 'package:flutter/material.dart';

class LoginHomeViewModel extends ChangeNotifier {
  int currentIndex = 0;
  bool isPunchedIn = false;

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void togglePunchInStatus() {
    isPunchedIn = !isPunchedIn;
    notifyListeners();
  }
}
