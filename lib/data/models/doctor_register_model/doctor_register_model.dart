class DoctorRegisterModel {
  
  bool? sucess;
  String? message;

  DoctorRegisterModel({
    this.sucess,
    this.message,
  });

  DoctorRegisterModel.fromJson(dynamic json) {
    sucess = json['sucess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sucess'] = sucess;
    map['message'] = message;
    return map;
  }
}