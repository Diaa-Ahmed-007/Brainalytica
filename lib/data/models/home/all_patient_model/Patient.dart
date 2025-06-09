class Patient {
  Patient({
      this.patientId, 
      this.firstName, 
      this.lastName, 
      this.emailAddress, 
      this.gender, 
      this.birthDate, 
      this.phoneNumber,});

  Patient.fromJson(dynamic json) {
    patientId = json['patient_Id'];
    firstName = json['first_Name'];
    lastName = json['last_Name'];
    emailAddress = json['email_Address'];
    gender = json['gender'];
    birthDate = json['birth_Date'];
    phoneNumber = json['phone_Number'];
  }
  num? patientId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? gender;
  String? birthDate;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patient_Id'] = patientId;
    map['first_Name'] = firstName;
    map['last_Name'] = lastName;
    map['email_Address'] = emailAddress;
    map['gender'] = gender;
    map['birth_Date'] = birthDate;
    map['phone_Number'] = phoneNumber;
    return map;
  }

}