import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/AnalysisAiModel.dart';
import 'package:doctors/data/models/home/save_patient_analysis_model/SavePatientAnalysisModel.dart';

abstract class AddPatientAnalysisDataSource {
   Future<Either<SavePatientAnalysisModel,String>> addPatientAnalysis({required AnalysisAiModel analysisAiModel,required String token});
}