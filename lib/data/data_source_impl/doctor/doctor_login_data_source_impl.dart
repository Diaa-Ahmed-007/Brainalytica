import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/core/api/exception_handling.dart';
import 'package:doctors/data/data_source_contract/doctor/doctor_login_data_source.dart';
import 'package:doctors/data/models/doctor_register_model/DoctorLoginModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DoctorLoginDataSource)
class DoctorLoginDataSourceImpl extends DoctorLoginDataSource {
  ApiManger apiManger;
  @factoryMethod
  DoctorLoginDataSourceImpl(this.apiManger);
  @override
  Future<Either<DoctorLoginModel, String>> doctorLogin(
      {required String emailAddress, required String password}) async {
    try {
      var response = await apiManger.postBackEndRequest(
          endPoints: EndPoints.doctorLoginEndPoint,
          body: {"Email_Address": emailAddress, "Password": password});
      DoctorLoginModel doctorLoginModel =
          DoctorLoginModel.fromJson(response.data);
      log(doctorLoginModel.token ?? "");
      return Left(doctorLoginModel);
    } on DioException catch (e) {
      String errorMessage = DioExceptionHandler.handleException(e);
      log("1$errorMessage");
      return Right(errorMessage);
    } catch (e) {
      log("2${e.toString()}");
      return Right(e.toString());
    }
  }
}
