import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/home/chat_bot_model/ChatBotModel.dart';

abstract class ChatbotDataSource {
  Future<Either<ChatBotModel,String>> getChatbotResponse({
    required String message,
    required String token,
  });
}