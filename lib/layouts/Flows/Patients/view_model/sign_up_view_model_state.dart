import 'package:doctors/data/models/patient_register_model/patient_register_model.dart';
import 'package:equatable/equatable.dart';

abstract class PatientRegisterViewModelState extends Equatable {
  const PatientRegisterViewModelState();

  @override
  List<Object?> get props => [];
}

class PatientRegisterViewModelInitState extends PatientRegisterViewModelState {}

class PatientRegisterViewModelLoadingState
    extends PatientRegisterViewModelState {}

class PatientRegisterViewModelErrorState extends PatientRegisterViewModelState {
  final String errorMessage;
  const PatientRegisterViewModelErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class PatientRegisterViewModelSuccessState
    extends PatientRegisterViewModelState {
  final PatientModel patientModel;
  const PatientRegisterViewModelSuccessState(this.patientModel);

  @override
  List<Object> get props => [patientModel];
}
