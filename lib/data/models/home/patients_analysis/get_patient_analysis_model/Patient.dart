class Patient {
  Patient({
      this.patientId, 
      this.firstName, 
      this.lastName, 
      this.emailAddress,});

  Patient.fromJson(dynamic json) {
    patientId = json['patient_Id'];
    firstName = json['first_Name'];
    lastName = json['last_Name'];
    emailAddress = json['email_Address'];
  }
  num? patientId;
  String? firstName;
  String? lastName;
  String? emailAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patient_Id'] = patientId;
    map['first_Name'] = firstName;
    map['last_Name'] = lastName;
    map['email_Address'] = emailAddress;
    return map;
  }

}