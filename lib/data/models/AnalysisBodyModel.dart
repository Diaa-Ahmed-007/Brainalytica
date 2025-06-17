class AnalysisBodyModel {
  AnalysisBodyModel({
      this.gender, 
      this.age, 
      this.hypertension, 
      this.heartDisease, 
      this.everMarried, 
      this.workType, 
      this.residenceType, 
      this.avgGlucoseLevel, 
      this.bmi, 
      this.smokingStatus,});

  AnalysisBodyModel.fromJson(dynamic json) {
    gender = json['gender'];
    age = json['age'];
    hypertension = json['hypertension'];
    heartDisease = json['heart_disease'];
    everMarried = json['ever_married'];
    workType = json['work_type'];
    residenceType = json['Residence_type'];
    avgGlucoseLevel = json['avg_glucose_level'];
    bmi = json['bmi'];
    smokingStatus = json['smoking_status'];
  }
  String? gender;
  num? age;
  String? hypertension;
  String? heartDisease;
  String? everMarried;
  String? workType;
  String? residenceType;
  num? avgGlucoseLevel;
  num? bmi;
  String? smokingStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gender'] = gender;
    map['age'] = age;
    map['hypertension'] = hypertension;
    map['heart_disease'] = heartDisease;
    map['ever_married'] = everMarried;
    map['work_type'] = workType;
    map['Residence_type'] = residenceType;
    map['avg_glucose_level'] = avgGlucoseLevel;
    map['bmi'] = bmi;
    map['smoking_status'] = smokingStatus;
    return map;
  }

}