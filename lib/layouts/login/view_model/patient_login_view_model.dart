import 'dart:developer';

import 'package:doctors/data/data_source_contract/patient/patient_login_data_source.dart';
import 'package:doctors/layouts/login/view_model/patient_login_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PatientLoginViewModel extends Cubit<PatientLoginViewModelState> {
  PatientLoginViewModel(this.patientLoginDataSource)
      : super(PatientLoginViewModelInitial());

  @factoryMethod
  PatientLoginDataSource patientLoginDataSource;
  static PatientLoginViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  patientLogin({required String emailAddress, required String password}) async {
    emit(PatientLoginViewModelLoadingState());
    final response = await patientLoginDataSource.patientLogin(
        emailAddress: emailAddress, password: password);
    log(response.toString());
    response.fold((loginResponse) {
      if (loginResponse.success == true) {
        emit(PatientLoginViewModelSuccessState(loginResponse));
      } else {
        emit(PatientLoginViewModelErrorState(
            loginResponse.message ?? "Unknown error occurred"));
      }
    }, (error) {
      log(error.toString());
      emit(
        PatientLoginViewModelErrorState(error),
      );
    });
  }
}
