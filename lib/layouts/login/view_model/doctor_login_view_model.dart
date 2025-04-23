import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:doctors/data/data_source_contract/doctor/doctor_login_data_source.dart';
import 'package:doctors/layouts/login/view_model/doctor_login_view_model_state.dart';

@injectable
class DoctorLoginViewModel extends Cubit<DoctorLoginViewModelState> {
  DoctorLoginViewModel(this.doctorLoginDataSource)
      : super(DoctorLoginViewModelInitial());

  @factoryMethod
  DoctorLoginDataSource doctorLoginDataSource;

  static DoctorLoginViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> doctorLogin({
    required String emailAddress,
    required String password,
  }) async {
    emit(DoctorLoginViewModelLoadingState());

    final response = await doctorLoginDataSource.doctorLogin(
      emailAddress: emailAddress,
      password: password,
    );

    response.fold(
      (doctorLoginModel) {
        log('Login Success');
        emit(DoctorLoginViewModelSuccessState(doctorLoginModel));
      },
      (errorMessage) {
        log('Login Failed: $errorMessage');
        emit(DoctorLoginViewModelErrorState(errorMessage));
      },
    );
  }
}
