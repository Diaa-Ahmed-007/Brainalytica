class ChatMessage {
  final String message;
  final bool isUser;
  final String? emotion;
  final String? botReply;

  ChatMessage({
    required this.message,
    required this.isUser,
    this.emotion,
    this.botReply,
  });
}
