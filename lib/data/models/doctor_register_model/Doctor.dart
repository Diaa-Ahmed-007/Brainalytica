class Doctor {
  Doctor({
    this.doctorId,
    this.firstName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.emailAddress,
    this.phoneNumber,
    this.specialization,
    this.address,
    this.password,
    this.doctorPatients,
    this.doctorMedicalImages,
  });

  num? doctorId;
  String? firstName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? emailAddress;
  String? phoneNumber;
  String? specialization;
  String? address;
  String? password;
  List<dynamic>? doctorPatients;
  List<dynamic>? doctorMedicalImages;

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorId: json['doctor_Id'],
      firstName: json['first_Name'],
      lastName: json['last_Name'],
      gender: json['gender'],
      birthDate: json['birth_Date'],
      emailAddress: json['email_Address'],
      phoneNumber: json['phone_Number'],
      specialization: json['specialization'],
      address: json['address'],
      password: json['password'],
      doctorPatients: json['doctorPatients'] ?? [],
      doctorMedicalImages: json['doctorMedicalImages'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctor_Id'] = doctorId;
    map['first_Name'] = firstName;
    map['last_Name'] = lastName;
    map['gender'] = gender;
    map['birth_Date'] = birthDate;
    map['email_Address'] = emailAddress;
    map['phone_Number'] = phoneNumber;
    map['specialization'] = specialization;
    map['address'] = address;
    map['password'] = password;
    if (doctorPatients != null) {
      map['doctorPatients'] = doctorPatients?.map((v) {
        if (v is Map<String, dynamic>) return v;
        return {};
      }).toList();
    }
    if (doctorMedicalImages != null) {
      map['doctorMedicalImages'] = doctorMedicalImages?.map((v) {
        if (v is Map<String, dynamic>) return v;
        return {};
      }).toList();
    }
    return map;
  }
}
