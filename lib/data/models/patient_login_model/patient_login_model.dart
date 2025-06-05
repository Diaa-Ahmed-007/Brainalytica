import 'User.dart';

class PatientLoginModel {
  PatientLoginModel({
      this.success, 
      this.message, 
      this.token, 
      this.user,});

  PatientLoginModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? success;
  String? message;
  String? token;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}