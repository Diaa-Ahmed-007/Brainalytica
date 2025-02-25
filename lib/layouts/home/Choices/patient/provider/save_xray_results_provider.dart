import 'package:flutter/material.dart';

class SaveXrayResultsProvider extends ChangeNotifier{
  String strokeDetection="";
  String strokeClassification="";

  void changeStrokeDetection(String strokeDetection){
    this.strokeDetection=strokeDetection;
    notifyListeners();    
  }

  void changeStrokeClassification(String strokeClassification){
    this.strokeClassification=strokeClassification;
    notifyListeners();    
  }
  //----------
}