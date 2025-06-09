class User {
  User({
      this.patientId, 
      this.emailAddress,});

  User.fromJson(dynamic json) {
    patientId = json['patient_Id'];
    emailAddress = json['email_Address'];
  }
  num? patientId;
  String? emailAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patient_Id'] = patientId;
    map['email_Address'] = emailAddress;
    return map;
  }

}