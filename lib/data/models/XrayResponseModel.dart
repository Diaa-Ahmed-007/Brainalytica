class XrayResponseModel {
  XrayResponseModel({
      this.strokeDetection, 
      this.strokeClassification,});

  XrayResponseModel.fromJson(dynamic json) {
    strokeDetection = json['stroke_detection'];
    strokeClassification = json['stroke_classification'];
  }
  String? strokeDetection;
  String? strokeClassification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stroke_detection'] = strokeDetection;
    map['stroke_classification'] = strokeClassification;
    return map;
  }

}