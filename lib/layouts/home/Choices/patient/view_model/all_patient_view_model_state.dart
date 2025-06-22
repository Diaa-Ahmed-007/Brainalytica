import 'package:doctors/data/models/home/patients_analysis/get_all_patients_analysis_model/GetAllPatientsAnalysisModel.dart';

abstract class AllPatientsViewModelState {}

class AllPatientsViewModelInitial extends AllPatientsViewModelState {}

class AllPatientsViewModelLoading extends AllPatientsViewModelState {}

class AllPatientsViewModelSuccess extends AllPatientsViewModelState {
  GetAllPatientsAnalysisModel getAllPatientsAnalysisModel;
  AllPatientsViewModelSuccess(this.getAllPatientsAnalysisModel);
}

class AllPatientsViewModelError extends AllPatientsViewModelState {
  String errorMessage;

  AllPatientsViewModelError(this.errorMessage);
}
