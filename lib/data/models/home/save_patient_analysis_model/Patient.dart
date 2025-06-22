class Patient {
  Patient({
      this.patientId, 
      this.firstName, 
      this.lastName, 
      this.gender, 
      this.birthDate, 
      this.emailAddress, 
      this.phoneNumber,});

  Patient.fromJson(dynamic json) {
    patientId = json['patient_Id'];
    firstName = json['first_Name'];
    lastName = json['last_Name'];
    gender = json['gender'];
    birthDate = json['birth_Date'];
    emailAddress = json['email_Address'];
    phoneNumber = json['phone_Number'];
  }
  num? patientId;
  String? firstName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? emailAddress;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patient_Id'] = patientId;
    map['first_Name'] = firstName;
    map['last_Name'] = lastName;
    map['gender'] = gender;
    map['birth_Date'] = birthDate;
    map['email_Address'] = emailAddress;
    map['phone_Number'] = phoneNumber;
    return map;
  }

}