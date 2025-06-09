class Data {
  Data({
      this.contactName, 
      this.address, 
      this.phoneNumber,});

  Data.fromJson(dynamic json) {
    contactName = json['contactName'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
  }
  String? contactName;
  String? address;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contactName'] = contactName;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

}