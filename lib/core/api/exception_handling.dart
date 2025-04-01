import 'package:dio/dio.dart';

class DioExceptionHandler {
  static String handleException(DioException e) {
    if (e.response != null) {
      return _handleStatusCode(e.response!.statusCode, e.response!.data);
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout, please try again.";
      case DioExceptionType.sendTimeout:
        return "Send timeout, please try again.";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout, please try again.";
      case DioExceptionType.badResponse:
        return "Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}";
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.connectionError:
        return "No internet connection. Please check your connection.";
      case DioExceptionType.unknown:
        return "Something went wrong. Please try again.";
      default:
        return "Unexpected error occurred.";
    }
  }

  static String _handleStatusCode(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return "Bad request. Please check your input.";
      case 401:
        return "Unauthorized. Please log in again.";
      case 403:
        return "Forbidden. You don't have permission to access this resource.";
      case 404:
        return "Resource not found.";
      case 409:
        return "A user with the same email already exists. Please use a different email.";
      case 500:
        return "Internal server error. Please try again later.";
      default:
        return "Error ${statusCode ?? 'Unknown'}: ${data?['message'] ?? 'An error occurred.'}";
    }
  }
}
