import 'package:doctors/data/models/home/chat_bot_model/ChatBotModel.dart';
import 'package:doctors/data/models/home/chat_bot_model/chat_massege.dart';

abstract class ChatBotViewModelStates {}

class ChatBotInitialState extends ChatBotViewModelStates {
  final List<ChatMessage> messages;
  ChatBotInitialState({this.messages = const []});
}

class ChatBotLoadingState extends ChatBotViewModelStates {
  final List<ChatMessage> messages;
  ChatBotLoadingState({required this.messages});
}

class ChatBotSuccessState extends ChatBotViewModelStates {
  final ChatBotModel chatBotModel;
  final List<ChatMessage> messages;
  ChatBotSuccessState(this.chatBotModel, {required this.messages});
}

class ChatBotErrorState extends ChatBotViewModelStates {
  final String errorMassage;
  final List<ChatMessage> messages;
  ChatBotErrorState(this.errorMassage, {required this.messages});
}
