import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/patient/patient_data_source_contract.dart';
import 'package:doctors/data/models/home/add_patient_data_model/AddPatientDateModel.dart';
import 'package:doctors/data/models/home/all_patient_model/GetAllPatientModel.dart';
import 'package:doctors/data/models/home/delete_patient_data_model/DeletePatientDataModel.dart';
import 'package:doctors/data/models/home/patient_by_id_model/PatientByIdModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PatientDataSource)
class PatientDataSourceimpl extends PatientDataSource {
  ApiManger apiManger;
  @factoryMethod
  PatientDataSourceimpl(this.apiManger);
  @override
  Future<Either<AddPatientDateModel, String>> addPatientData(
      {required bool hadStroke,
      required String strokeInjuryDate,
      required double weight,
      required String bloodType,
      required bool bloodTransfusion,
      required String pharmaceutical,
      required String chronicDiseases,
      required bool hadSurgery,
      required int patientId}) async {
    try {
      var response = await apiManger.postBackEndRequest(
          endPoints: EndPoints.addPatientEndPoint(patientId: patientId),
          body: {
            "Had_Stroke": hadStroke,
            "StrokeInjury_Date": strokeInjuryDate,
            "Weight": weight,
            "Blood_Type": bloodType,
            "Blood_Transfusion": bloodTransfusion,
            "Pharmaceutical": pharmaceutical,
            "Chronic_Diseases": chronicDiseases,
            "Had_Surgery": hadSurgery
          });
      AddPatientDateModel addPatientDateModel =
          AddPatientDateModel.fromJson(response.data);
      return Left(addPatientDateModel);
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<DeletePatientDataModel, String>> deletePatient(
      {required int id}) {
    // TODO: implement deletePatient
    throw UnimplementedError();
  }

  @override
  Future<Either<GetAllPatientModel, String>> getAllPatient() async {
    try {
      var response = await apiManger.getBackEndRequest(
          endPoints: EndPoints.getAllPatientsEndPoint);
      GetAllPatientModel getAllPatientModel =
          GetAllPatientModel.fromJson(response.data);
      return Left(getAllPatientModel);
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<PatientByIdModel, String>> getPatientById({required int id}) {
    // TODO: implement getPatientById
    throw UnimplementedError();
  }
}
