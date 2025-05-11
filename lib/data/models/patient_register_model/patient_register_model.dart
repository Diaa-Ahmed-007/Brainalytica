import 'user_model.dart';

class PatientModel {
  PatientModel({
    this.success,
    this.message,
    this.user,
  });

  PatientModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? Usermodel.fromJson(json['user']) : null;
  }
  bool? success;
  String? message;
  Usermodel? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}
