import 'package:doctors/data/models/doctor_register_model/doctor_login_model.dart';

abstract class DoctorLoginViewModelState {}

class DoctorLoginViewModelInitial extends DoctorLoginViewModelState {}

class DoctorLoginViewModelLoadingState extends DoctorLoginViewModelState {}

class DoctorLoginViewModelSuccessState extends DoctorLoginViewModelState {
  final DoctorLoginModel doctorLoginModel;
  DoctorLoginViewModelSuccessState(this.doctorLoginModel);
}

class DoctorLoginViewModelErrorState extends DoctorLoginViewModelState {
  final String error;
  DoctorLoginViewModelErrorState(this.error);
}
