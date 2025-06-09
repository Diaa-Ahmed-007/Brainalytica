import 'package:flutter/material.dart';

class PatientRegisterProvider extends ChangeNotifier {
  String? selectedGender;

  void selectGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }
}
