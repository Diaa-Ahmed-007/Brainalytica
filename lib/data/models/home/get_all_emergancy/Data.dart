class Data {
  Data({
    this.contactName,
    this.address,
    this.phoneNumber,
    this.patientId,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.gender,
    this.birthDate,
    this.phoneNumber2,
  });

  Data.fromJson(dynamic json) {
    contactName = json['contactName'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    patientId = json['patient_Id'];
    firstName = json['first_Name'];
    lastName = json['last_Name'];
    emailAddress = json['email_Address'];
    gender = json['gender'];
    birthDate = json['birth_Date'];
    phoneNumber2 = json['phone_Number'];
  }
  String? contactName;
  String? address;
  String? phoneNumber;
  num? patientId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? gender;
  String? birthDate;
  String? phoneNumber2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contactName'] = contactName;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;
    map['patient_Id'] = patientId;
    map['first_Name'] = firstName;
    map['last_Name'] = lastName;
    map['email_Address'] = emailAddress;
    map['gender'] = gender;
    map['birth_Date'] = birthDate;
    map['phone_Number'] = phoneNumber2;
    return map;
  }
}
