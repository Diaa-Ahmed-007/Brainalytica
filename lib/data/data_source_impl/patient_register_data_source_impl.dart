import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/patient_register_data_source.dart';
import 'package:doctors/data/models/patient_regester_model/PatientModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PatientRegisterDataSource)
class PatientRegisterDataSourceImpl extends PatientRegisterDataSource {
  ApiManger apiManger;
  @factoryMethod
  PatientRegisterDataSourceImpl(this.apiManger);
  @override
  Future<Either<PatientModel, String>> registerPatient({required String firstName, required String lastName, required String gender, required String birthDate, required String emailAddress, required String phoneNumber, required String password}) async {
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
    } catch (e) {
      print(e.toString());
      return Right(e.toString());
    }
  }
}
