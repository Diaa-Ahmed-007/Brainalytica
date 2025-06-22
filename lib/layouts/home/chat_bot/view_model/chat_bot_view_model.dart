import 'package:doctors/data/data_source_contract/home/chatbot_data_source.dart';
import 'package:doctors/data/models/home/chat_bot_model/chat_massege.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'chat_bot_view_model_states.dart';

@injectable
class ChatBotViewModel extends Cubit<ChatBotViewModelStates> {
  final ChatbotDataSource chatbotDataSource;

  ChatBotViewModel(this.chatbotDataSource) : super(ChatBotInitialState());

  final List<ChatMessage> messages = [];

  Future<void> sendMessage({required String message, required String token}) async {
  if (message.trim().isEmpty) return;

  messages.add(ChatMessage(message: message, isUser: true));
  emit(ChatBotLoadingState(messages: List.from(messages)));

  final result = await chatbotDataSource.getChatbotResponse(message: message, token: token);

  result.fold(
    (chatBotModel) {
      messages.add(ChatMessage(
        message: chatBotModel.data?.botReply ?? "",
        isUser: false,
        botReply: chatBotModel.data?.botReply,
      ));
      emit(ChatBotSuccessState(chatBotModel, messages: List.from(messages)));
    },
    (error) {
      emit(ChatBotErrorState(error, messages: List.from(messages)));
    },
  );
}


  void resetConversation() {
    messages.clear();
    emit(ChatBotInitialState(messages: List.from(messages)));
  }
}
