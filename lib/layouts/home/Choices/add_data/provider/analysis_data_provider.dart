import 'package:flutter/material.dart';

class AnalysisDataProvider extends ChangeNotifier {
  String _prediction = '';
  double _probability = 0.0;

  String get prediction => _prediction;
  double get probability => _probability;

  void setPrediction(String val) {
    _prediction = val;
    notifyListeners();
  }

  void setProbability(double val) {
    _probability = val;
    notifyListeners();
  }
}
