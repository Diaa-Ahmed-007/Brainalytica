import 'package:doctors/data/models/doctor_register_model/doctor_register_model.dart';

abstract class DoctorRegisterViewModelState {
  
}


class DoctorRegisterInitialState extends DoctorRegisterViewModelState {
}

class DoctorRegisterLoadingState extends DoctorRegisterViewModelState {

}

class DoctorRegisterSuccessState extends DoctorRegisterViewModelState {
  final DoctorRegisterModel doctorRegisterModel;

  DoctorRegisterSuccessState(this.doctorRegisterModel);
}

class DoctorRegisterErrorState extends DoctorRegisterViewModelState {
  final String errorMessage;

  DoctorRegisterErrorState(this.errorMessage);
}