import 'package:doctors/data/models/patient_login_model/patient_login_model.dart';

abstract class PatientLoginViewModelState {}

class PatientLoginViewModelInitial extends PatientLoginViewModelState {}

class PatientLoginViewModelLoadingState extends PatientLoginViewModelState {}

class PatientLoginViewModelErrorState extends PatientLoginViewModelState {
  String errorMessage;
  PatientLoginViewModelErrorState(this.errorMessage);
}

class PatientLoginViewModelSuccessState extends PatientLoginViewModelState {
  PatientLoginModel patientLoginModel;
  PatientLoginViewModelSuccessState(this.patientLoginModel);
}
