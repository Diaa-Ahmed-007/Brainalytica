class AllDoctorsModel {
  AllDoctorsModel({
      this.firstName, 
      this.lastName, 
      this.gender, 
      this.birthDate, 
      this.emailAddress, 
      this.phoneNumber, 
      this.specialization, 
      this.address, 
      this.password,});

  AllDoctorsModel.fromJson(dynamic json) {
    firstName = json['first_Name'];
    lastName = json['last_Name'];
    gender = json['gender'];
    birthDate = json['birth_Date'];
    emailAddress = json['email_Address'];
    phoneNumber = json['phone_Number'];
    specialization = json['specialization'];
    address = json['address'];
    password = json['password'];
  }
  String? firstName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? emailAddress;
  String? phoneNumber;
  String? specialization;
  String? address;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_Name'] = firstName;
    map['last_Name'] = lastName;
    map['gender'] = gender;
    map['birth_Date'] = birthDate;
    map['email_Address'] = emailAddress;
    map['phone_Number'] = phoneNumber;
    map['specialization'] = specialization;
    map['address'] = address;
    map['password'] = password;
    return map;
  }

}