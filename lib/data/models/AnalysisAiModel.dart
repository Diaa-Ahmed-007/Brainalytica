class AnalysisAiModel {
  String? prediction;
  num? probability;

  AnalysisAiModel({
    this.prediction,
    this.probability,
  });

  AnalysisAiModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      prediction = json['prediction'];
      probability = json['probability'];
    } else {
      throw FormatException("Expected Map<String, dynamic>, got: $json");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'prediction': prediction,
      'probability': probability,
    };
  }
}
