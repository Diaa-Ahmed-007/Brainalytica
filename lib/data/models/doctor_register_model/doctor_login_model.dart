class DoctorLoginModel {
  DoctorLoginModel({
      this.success, 
      this.message, 
      this.token, 
      this.doctor, 
      this.emailAddress,});

  DoctorLoginModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    doctor = json['doctor'];
    emailAddress = json['email_Address'];
  }
  bool? success;
  String? message;
  String? token;
  num? doctor;
  String? emailAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['token'] = token;
    map['doctor'] = doctor;
    map['email_Address'] = emailAddress;
    return map;
  }

}