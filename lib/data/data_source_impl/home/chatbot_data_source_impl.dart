import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/home/chatbot_data_source.dart';
import 'package:doctors/data/models/home/chat_bot_model/ChatBotModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChatbotDataSource)
class ChatbotDataSourceImpl extends ChatbotDataSource {
  ApiManger apiManger;
  @factoryMethod
  ChatbotDataSourceImpl(this.apiManger);
  @override
  Future<Either<ChatBotModel, String>> getChatbotResponse(
      {required String message, required String token}) async {
    try {
      var response = await apiManger.postBackEndRequest(
          endPoints: EndPoints.getChatbotResponseEndPoint,
          body: {
            "text": message,
            "token": token,
          },
          headers: {
            'Authorization': "Bearer $token"
          });
      ChatBotModel chatBotModel = ChatBotModel.fromJson(response.data);
      return Left(chatBotModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
