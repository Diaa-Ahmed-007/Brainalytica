import 'dart:io';

import 'package:flutter/material.dart';

class UploadProvider extends ChangeNotifier {
  bool _isShown = false;
  File? _file;

  bool get isShown => _isShown;
  File? get file => _file;

  void changeIsShown(bool value) {
    _isShown = value;
    notifyListeners();
  }

  void setFile(File newFile) {
    _file = newFile;
    notifyListeners();
  }
}
