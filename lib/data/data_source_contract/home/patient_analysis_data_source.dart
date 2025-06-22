import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/home/patients_analysis/get_all_patients_analysis_model/GetAllPatientsAnalysisModel.dart';
import 'package:doctors/data/models/home/patients_analysis/get_patient_analysis_model/GetPatientAnalysisModel.dart';

abstract class PatientAnalysisDataSource {
  Future<Either<GetAllPatientsAnalysisModel, String>> getAllPatientsAnalysis();
  Future<Either<GetPatientAnalysisModel, String>> getPatientByToken({required String token});
}