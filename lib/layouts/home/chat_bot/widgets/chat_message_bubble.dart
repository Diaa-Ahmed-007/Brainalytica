import 'package:doctors/layouts/home/chat_bot/widgets/typing_indicator.dart';
import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final bool isLoading;
  final String? botReply;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.isUser,
    this.isLoading = false,
    this.botReply,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color userBubble = theme.colorScheme.primary;
    final Color assistantBubble = theme.brightness == Brightness.dark
        ? theme.colorScheme.surfaceContainerHighest.withAlpha(180)
        : Colors.grey.shade200;

    final Color userTextColor = theme.colorScheme.onPrimary;
    final Color assistantTextColor = theme.colorScheme.onSurface;

    if (isLoading) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: TypingIndicator(
            brightColor: theme.colorScheme.primary,
            darkColor: theme.disabledColor,
          ),
        ),
      );
    }

    if (!isUser && botReply != null) {

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade200),
          ),
          child: Text(
            botReply!,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isUser ? userBubble : assistantBubble,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                isUser ? const Radius.circular(12) : const Radius.circular(0),
            bottomRight:
                isUser ? const Radius.circular(0) : const Radius.circular(12),
          ),
        ),
        child: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isUser ? userTextColor : assistantTextColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
