import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/core/api/exception_handling.dart';
import 'package:doctors/data/data_source_contract/patient/patient_login_data_source.dart';
import 'package:doctors/data/models/patient_login_model/patient_login_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PatientLoginDataSource)
class PatientLoginDataSourceImpl extends PatientLoginDataSource {
  ApiManger apiManger;
  @factoryMethod
  PatientLoginDataSourceImpl(this.apiManger);
  @override
  Future<Either<PatientLoginModel, String>> patientLogin(
      {required String emailAddress, required String password}) async {
    try {
      var response = await apiManger.postBackEndRequest(
          endPoints: EndPoints.patientLoginEndPoint,
          body: {"Email_Address": emailAddress, "Password": password});
      PatientLoginModel patientLoginResponse =
          PatientLoginModel.fromJson(response.data);
      log(patientLoginResponse.token ?? "");
      return Left(patientLoginResponse);
    } on DioException catch (e) {
      String errorMessage = DioExceptionHandler.handleException(e);
      log("1$errorMessage");
      return Right(errorMessage);
    } catch (e) {
      log("2 ${e.toString()}");
      return Right(e.toString());
    }
  }
}
