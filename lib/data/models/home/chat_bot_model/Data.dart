class Data {
  Data({
      this.userMessage, 
      this.emotion, 
      this.botReply,});

  Data.fromJson(dynamic json) {
    userMessage = json['userMessage'];
    emotion = json['emotion'];
    botReply = json['botReply'];
  }
  String? userMessage;
  String? emotion;
  String? botReply;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userMessage'] = userMessage;
    map['emotion'] = emotion;
    map['botReply'] = botReply;
    return map;
  }

}