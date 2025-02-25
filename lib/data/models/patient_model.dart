class PatientModel {
  String? massage;
  PatientModel({
    required this.massage,
  });
  PatientModel.fromJson(dynamic json) {
    if (json['massage'] != null) {
      massage = json['massage'];
    }
  }
  Map<String, dynamic> toJson() => {
        "massage": massage,
      };
}
