class PredictionResult {
  PredictionResult({
      this.predictionResultId, 
      this.result, 
      this.probability, 
      this.createdAt,});

  PredictionResult.fromJson(dynamic json) {
    predictionResultId = json['predictionResult_Id'];
    result = json['result'];
    probability = json['probability'];
    createdAt = json['created_At'];
  }
  num? predictionResultId;
  String? result;
  num? probability;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['predictionResult_Id'] = predictionResultId;
    map['result'] = result;
    map['probability'] = probability;
    map['created_At'] = createdAt;
    return map;
  }

}