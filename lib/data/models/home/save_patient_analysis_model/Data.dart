import 'Patient.dart';
import 'PredictionResult.dart';

class Data {
  Data({
      this.predictionId, 
      this.gender, 
      this.age, 
      this.hypertension, 
      this.heartDisease, 
      this.everMarried, 
      this.workType, 
      this.residenceType, 
      this.avgGlucoseLevel, 
      this.bmi, 
      this.smokingStatus, 
      this.createdAt, 
      this.patientId, 
      this.patient,
      this.predictionResult,});

  Data.fromJson(dynamic json) {
    predictionId = json['prediction_Id'];
    gender = json['gender'];
    age = json['age'];
    hypertension = json['hypertension'];
    heartDisease = json['heartDisease'];
    everMarried = json['everMarried'];
    workType = json['workType'];
    residenceType = json['residenceType'];
    avgGlucoseLevel = json['avgGlucoseLevel'];
    bmi = json['bmi'];
    smokingStatus = json['smokingStatus'];
    createdAt = json['createdAt'];
    patientId = json['patient_Id'];
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    
    predictionResult = json['predictionResult'] != null ? PredictionResult.fromJson(json['predictionResult']) : null;
  }
  num? predictionId;
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
  String? createdAt;
  num? patientId;
  Patient? patient;
  PredictionResult? predictionResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prediction_Id'] = predictionId;
    map['gender'] = gender;
    map['age'] = age;
    map['hypertension'] = hypertension;
    map['heartDisease'] = heartDisease;
    map['everMarried'] = everMarried;
    map['workType'] = workType;
    map['residenceType'] = residenceType;
    map['avgGlucoseLevel'] = avgGlucoseLevel;
    map['bmi'] = bmi;
    map['smokingStatus'] = smokingStatus;
    map['createdAt'] = createdAt;
    map['patient_Id'] = patientId;
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    if (predictionResult != null) {
      map['predictionResult'] = predictionResult?.toJson();
    }
    return map;
  }

}