import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/home/add_patient_data_model/AddPatientDateModel.dart';
import 'package:doctors/data/models/home/all_patient_model/GetAllPatientModel.dart';
import 'package:doctors/data/models/home/delete_patient_data_model/DeletePatientDataModel.dart';
import 'package:doctors/data/models/home/patient_by_id_model/PatientByIdModel.dart';

abstract class PatientDataSource {
  Future<Either<GetAllPatientModel, String>> getAllPatient();
  Future<Either<PatientByIdModel, String>> getPatientById({required int id});
  Future<Either<AddPatientDateModel, String>> addPatientData(
      {required bool hadStroke,
      required String strokeInjuryDate,
      required double weight,
      required String bloodType,
      required bool bloodTransfusion,
      required String pharmaceutical,
      required String chronicDiseases,
      required bool hadSurgery,required int patientId});
  Future<Either<DeletePatientDataModel, String>> deletePatient(
      {required int id});
}
