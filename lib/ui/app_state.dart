import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int? selectedCategoryId;

  void updateCategoryId(int? selectedCategoryId) {
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}
