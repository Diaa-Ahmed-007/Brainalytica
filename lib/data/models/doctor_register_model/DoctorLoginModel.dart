import 'Doctor.dart';

class DoctorLoginModel {
  DoctorLoginModel({
    this.token,
    this.doctor,
  });

  String? token;
  Doctor? doctor;

  DoctorLoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (doctor != null) {
      map['doctor'] = doctor?.toJson();
    }
    return map;
  }
}
