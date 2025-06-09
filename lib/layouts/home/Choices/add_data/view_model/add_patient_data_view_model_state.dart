import 'package:doctors/data/models/home/add_patient_data_model/AddPatientDateModel.dart';

abstract class AddPatientDataViewModelState {}

class AddPatientDataViewModelInitial extends AddPatientDataViewModelState {}

class AddPatientDataViewModelSuccessState extends AddPatientDataViewModelState {
  AddPatientDateModel addPatientDateModel;

  AddPatientDataViewModelSuccessState({required this.addPatientDateModel});
}

class AddPatientDataViewModelErrorState extends AddPatientDataViewModelState {
  String errorMessage;

  AddPatientDataViewModelErrorState({required this.errorMessage});
}

class AddPatientDataViewModelLoadingState
    extends AddPatientDataViewModelState {}
