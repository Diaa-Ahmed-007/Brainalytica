import 'package:doctors/data/models/home/emergancy_model/AddEmergancyModel.dart';

abstract class AddEmergancyViewModelState {
  
}

class AddEmergancyViewModelInitial extends AddEmergancyViewModelState {}

class AddEmergancyViewModelLoadingState extends AddEmergancyViewModelState {}

class AddEmergancyViewModelSuccessState extends AddEmergancyViewModelState {
  AddEmergancyModel addEmergancyModel;

  AddEmergancyViewModelSuccessState({required this.addEmergancyModel});
}

class AddEmergancyViewModelErrorState extends AddEmergancyViewModelState {
  String errorMessage;

  AddEmergancyViewModelErrorState({required this.errorMessage});
}