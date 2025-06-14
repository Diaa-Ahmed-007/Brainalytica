import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/core/api/exception_handling.dart';
import 'package:doctors/data/data_source_contract/patient/patient_register_data_source.dart';
import 'package:doctors/data/models/patient_register_model/patient_register_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PatientRegisterDataSource)
class PatientRegisterDataSourceImpl extends PatientRegisterDataSource {
  ApiManger apiManger;
  @factoryMethod
  PatientRegisterDataSourceImpl(this.apiManger);
  @override
  Future<Either<PatientModel, String>> registerPatient(
      {required String firstName,
      required String lastName,
      required String gender,
      required String birthDate,
      required String emailAddress,
      required String phoneNumber,
      required String password}) async {
    try {
      var response = await apiManger.postBackEndRequest(
          endPoints: EndPoints.patientRegisterEndPoint,
          body: {
            "First_Name": firstName,
            "Last_Name": lastName,
            "Gender": gender,
            "Birth_Date": birthDate,
            "Email_Address": emailAddress,
            "Phone_Number": phoneNumber,
            "Password": password
          });
      PatientModel patientRegisterResponse =
          PatientModel.fromJson(response.data);
      return Left(patientRegisterResponse);
    } on DioException catch (e) {
      String errorMessage = DioExceptionHandler.handleException(e);
      return Right(errorMessage);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
