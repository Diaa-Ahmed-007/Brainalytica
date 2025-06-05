import 'Data.dart';

class PatientByIdModel {
  PatientByIdModel({
      this.sucess, 
      this.message, 
      this.data,});

  PatientByIdModel.fromJson(dynamic json) {
    sucess = json['sucess'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? sucess;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sucess'] = sucess;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}