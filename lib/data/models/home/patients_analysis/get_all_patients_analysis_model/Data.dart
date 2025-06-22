import 'StrokePrediction.dart';

class Data {
  Data({
      this.predictionResultId, 
      this.result, 
      this.probability, 
      this.createdAt, 
      this.strokePrediction,});

  Data.fromJson(dynamic json) {
    predictionResultId = json['predictionResult_Id'];
    result = json['result'];
    probability = json['probability'];
    createdAt = json['created_At'];
    strokePrediction = json['strokePrediction'] != null ? StrokePrediction.fromJson(json['strokePrediction']) : null;
  }
  num? predictionResultId;
  String? result;
  num? probability;
  String? createdAt;
  StrokePrediction? strokePrediction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['predictionResult_Id'] = predictionResultId;
    map['result'] = result;
    map['probability'] = probability;
    map['created_At'] = createdAt;
    if (strokePrediction != null) {
      map['strokePrediction'] = strokePrediction?.toJson();
    }
    return map;
  }

}