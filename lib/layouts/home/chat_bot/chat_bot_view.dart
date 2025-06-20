import 'package:doctors/layouts/home/chat_bot/widgets/chat_bot_app_bar.dart';
import 'package:doctors/layouts/home/chat_bot/widgets/chat_bot_body.dart';
import 'package:flutter/material.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as String?;

    final token = args;

    if (token == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            "Missing session data.",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: const ChatBotAppBar(),
      body: ChatBotBody(token: token),
    );
  }
}
