import 'Data.dart';

class AllDoctorsModel {
  AllDoctorsModel({
      this.sucess, 
      this.message, 
      this.data,});

  AllDoctorsModel.fromJson(dynamic json) {
    sucess = json['sucess'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? sucess;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sucess'] = sucess;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}