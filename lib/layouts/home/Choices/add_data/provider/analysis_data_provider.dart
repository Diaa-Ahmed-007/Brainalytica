import 'package:flutter/material.dart';

class AnalysisDataProvider extends ChangeNotifier{
  
  String prediction = '';
  double probability = 0;

  void setPrediction(String newPrediction){
    if (newPrediction == prediction) {
      return;
    }
    prediction = newPrediction;
    notifyListeners();
  }

  void setProbability(double newProbability){
    if (newProbability == probability) {
      return;
    }
    probability = newProbability;
    notifyListeners();
  }

}