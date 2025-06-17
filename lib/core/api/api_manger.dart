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
// xray model server

  static late Dio dioAiModel;
  static initXrayAiModel() {
    dioBackEnd = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrlXrayAiModel,
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

  Future<Response> postXrayAiModelRequest({
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

//---------------------------------------------------

  static late Dio dioAnalysis;
  static initAnaysisAiModel() {
    dioAnalysis = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrlAnalysisAiModel,
      ),
    );
  }

  Future<Response> postAnalysisAiModelRequest({
    required String endPoints,
    Map<String, dynamic>? body,
  }) async {
    Response response = await dioAnalysis.post(
      endPoints,
      data: body,
      options: Options(
        headers: {"Content-Type": "application/json"},
        followRedirects: false,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    if (response.statusCode == 307) {
      final redirectedUrl = response.headers.value('location');
      if (redirectedUrl != null) {
        response = await dioAnalysis.post(
          redirectedUrl,
          data: body,
          options: Options(
            headers: {"Content-Type": "application/json"},
          ),
        );
      } else {
        throw Exception("🔴 307 Redirection بدون Location header.");
      }
    }

    return response;
  }
}
