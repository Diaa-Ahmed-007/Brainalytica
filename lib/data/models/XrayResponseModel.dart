class XrayResponseModel {
  XrayResponseModel({
    this.strokeDetection,
    this.strokeClassification,
  });

  XrayResponseModel.fromJson(dynamic json) {
    strokeDetection = json['stroke_detection'];
    strokeClassification = json['stroke_classification'];
    category = json["category"];
  }
  String? strokeDetection;
  String? strokeClassification;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stroke_detection'] = strokeDetection;
    map['stroke_classification'] = strokeClassification;
    map["category"] = category;
    return map;
  }
}
