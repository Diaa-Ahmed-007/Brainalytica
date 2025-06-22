import 'package:doctors/data/data_source_contract/doctor/doctor_register_data_source.dart';
import 'package:doctors/layouts/Flows/doctors/view_model/doctor_register_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DoctorRegisterViewModel extends Cubit<DoctorRegisterViewModelState> {
  DoctorRegisterViewModel(this.doctorRegisterDataSource)
      : super(DoctorRegisterInitialState());
  @factoryMethod
  DoctorRegisterDataSource doctorRegisterDataSource;

  Future<void> registerDoctor(
      {required String firstName,
      required String lastName,
      required String gender,
      required String birthDate,
      required String emailAddress,
      required String phoneNumber,
      required String password,
      required String specialization,
      required String address}) async {
    emit(DoctorRegisterLoadingState());
    final response = await doctorRegisterDataSource.registerPatient(
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        birthDate: birthDate,
        emailAddress: emailAddress,
        phoneNumber: phoneNumber,
        password: password,
        specialization: specialization,
        address: address);
    response.fold((doctorRegisterModel) {
      if (doctorRegisterModel.sucess == false) {
        emit(DoctorRegisterErrorState(
            doctorRegisterModel.message ?? "Unknown error occurred"));
      }
      emit(DoctorRegisterSuccessState(doctorRegisterModel));
    }, (errorMessage) {
      emit(DoctorRegisterErrorState(errorMessage));
    });
  }
}
