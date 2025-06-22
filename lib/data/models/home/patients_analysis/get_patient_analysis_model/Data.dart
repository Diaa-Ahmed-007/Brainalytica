import 'Patient.dart';
import 'StrokePrediction.dart';
import 'PredictionResult.dart';

class Data {
  Data({
      this.patient, 
      this.strokePrediction, 
      this.predictionResult,});

  Data.fromJson(dynamic json) {
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    strokePrediction = json['strokePrediction'] != null ? StrokePrediction.fromJson(json['strokePrediction']) : null;
    predictionResult = json['predictionResult'] != null ? PredictionResult.fromJson(json['predictionResult']) : null;
  }
  Patient? patient;
  StrokePrediction? strokePrediction;
  PredictionResult? predictionResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    if (strokePrediction != null) {
      map['strokePrediction'] = strokePrediction?.toJson();
    }
    if (predictionResult != null) {
      map['predictionResult'] = predictionResult?.toJson();
    }
    return map;
  }

}