class Data {
  Data({
      this.hadStroke, 
      this.strokeInjuryDate, 
      this.weight, 
      this.bloodType, 
      this.bloodTransfusion, 
      this.pharmaceutical, 
      this.chronicDiseases, 
      this.hadSurgery,});

  Data.fromJson(dynamic json) {
    hadStroke = json['had_Stroke'];
    strokeInjuryDate = json['strokeInjury_Date'];
    weight = json['weight'];
    bloodType = json['blood_Type'];
    bloodTransfusion = json['blood_Transfusion'];
    pharmaceutical = json['pharmaceutical'];
    chronicDiseases = json['chronic_Diseases'];
    hadSurgery = json['had_Surgery'];
  }
  bool? hadStroke;
  String? strokeInjuryDate;
  num? weight;
  String? bloodType;
  bool? bloodTransfusion;
  String? pharmaceutical;
  String? chronicDiseases;
  bool? hadSurgery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['had_Stroke'] = hadStroke;
    map['strokeInjury_Date'] = strokeInjuryDate;
    map['weight'] = weight;
    map['blood_Type'] = bloodType;
    map['blood_Transfusion'] = bloodTransfusion;
    map['pharmaceutical'] = pharmaceutical;
    map['chronic_Diseases'] = chronicDiseases;
    map['had_Surgery'] = hadSurgery;
    return map;
  }

}