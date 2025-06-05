import 'package:doctors/data/models/home/all_patient_model/GetAllPatientModel.dart';

abstract class AllPatientsViewModelState {}

class AllPatientsViewModelInitial extends AllPatientsViewModelState {}

class AllPatientsViewModelLoading extends AllPatientsViewModelState {}

class AllPatientsViewModelSuccess extends AllPatientsViewModelState {
  GetAllPatientModel getAllPatientModel;
  AllPatientsViewModelSuccess(this.getAllPatientModel);
}

class AllPatientsViewModelError extends AllPatientsViewModelState {
  String errorMessage;

  AllPatientsViewModelError(this.errorMessage);
}
