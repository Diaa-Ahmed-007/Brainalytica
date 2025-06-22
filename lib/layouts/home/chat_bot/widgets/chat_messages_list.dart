import 'package:doctors/data/models/home/chat_bot_model/chat_massege.dart';
import 'package:doctors/layouts/home/chat_bot/widgets/chat_message_bubble.dart';
import 'package:flutter/material.dart';

class ChatMessagesList extends StatelessWidget {
  final List<ChatMessage> messages;
  final bool showTyping;
  final ScrollController? controller;

  const ChatMessagesList({
    super.key,
    required this.messages,
    this.showTyping = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final fullMessages = List<ChatMessage>.from(messages);

    if (showTyping) {
      fullMessages.add(ChatMessage(message: "", isUser: false));
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final msg = fullMessages[index];
          return ChatMessageBubble(
            message: msg.message,
            isUser: msg.isUser,
            botReply: msg.botReply,
            isLoading: showTyping &&
                index == fullMessages.length - 1 &&
                !msg.isUser &&
                msg.message.isEmpty,
          );
        },
        childCount: fullMessages.length,
      ),
    );
  }
}
