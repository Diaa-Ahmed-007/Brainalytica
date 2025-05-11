import 'dart:developer';

import 'package:doctors/data/data_source_contract/patient/patient_register_data_source.dart';
import 'package:doctors/layouts/Flows/Patients/view_model/sign_up_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PatientRegisterViewModel extends Cubit<PatientRegisterViewModelState> {
  @factoryMethod
  PatientRegisterViewModel(this.patientRegisterDataSource)
      : super(PatientRegisterViewModelInitState());

  final PatientRegisterDataSource patientRegisterDataSource;

  static PatientRegisterViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> signUp(
      {required String firstName,
      required String lastName,
      required String gender,
      required String birthDate,
      required String emailAddress,
      required String phoneNumber,
      required String password}) async {
    emit(PatientRegisterViewModelLoadingState());

    final response = await patientRegisterDataSource.registerPatient(
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        birthDate: birthDate,
        emailAddress: emailAddress,
        phoneNumber: phoneNumber,
        password: password);

    response.fold((signUp) {
      if (signUp.success == true) {
        emit(PatientRegisterViewModelSuccessState(signUp));
      } else {
        emit(PatientRegisterViewModelErrorState(
            signUp.message ?? "Unknown error occurred"));
      }
    }, (error) {
      emit(PatientRegisterViewModelErrorState(error));
    });
  }
}
