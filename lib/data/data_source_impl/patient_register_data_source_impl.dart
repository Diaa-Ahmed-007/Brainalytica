import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/patient_register_data_source.dart';
import 'package:doctors/data/models/patient_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PatientRegisterDataSource)
class PatientRegisterDataSourceImpl extends PatientRegisterDataSource {
  ApiManger apiManger;
  @factoryMethod
  PatientRegisterDataSourceImpl(this.apiManger);
  @override
  Future<Either<PatientModel, String>> registerPatient() async {
    try {
      var response = await apiManger.postBackEndRequest(
          endPoints: EndPoints.patientRegisterEndPoint);
      PatientModel patientRegisterResponse =
          PatientModel.fromJson(response.data);
      return Left(patientRegisterResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
