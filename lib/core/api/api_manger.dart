import 'package:dio/dio.dart';
import 'package:doctors/core/contants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManger {
  static late Dio dioBackEnd;

  // BackEnd server
  static initBackEnd() {
    dioBackEnd = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrlBackEndServer,
      ),
    );
  }

  Future<Response> getBackEndRequest(
      {required String endPoints,
      Map<String, dynamic>? queryParameters}) async {
    var response = await dioBackEnd.get(
      endPoints,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> postBackEndRequest(
      {required String endPoints, Map<String, dynamic>? body}) async {
    var response = await dioBackEnd.post(endPoints, data: body);
    return response;
  }
  
  Future<Response> deleteBackEndRequest({
  required String endPoints,
  Map<String, dynamic>? body,
}) async {
  var response = await dioBackEnd.delete(
    endPoints,
    data: body,
  );
  return response;
}

//---------------------------------------------------
// Ai model server

  static late Dio dioAiModel;
  static initAiModel() {
    dioBackEnd = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrlAiModelServer,
      ),
    );
  }

  Future<Response> getAiModelRequest(
      {required String endPoints,
      Map<String, dynamic>? queryParameters}) async {
    var response = await dioBackEnd.get(
      endPoints,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> postAiModelRequest({
    required String endPoints,
    Map<String, dynamic>? body,
    String? imageFile,
  }) async {
    FormData formData = FormData.fromMap({
      ...?body,
      if (imageFile != null)
        "file": await MultipartFile.fromFile(imageFile, filename: "upload.jpg"),
    });
    var response = await dioBackEnd.post(
      endPoints,
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );

    return response;
  }
}
