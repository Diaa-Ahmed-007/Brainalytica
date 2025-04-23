import 'package:doctors/data/models/doctor_register_model/AllDoctorsModel.dart';

abstract class AllDoctorsViewModelState {
  
}

class AllDoctorsViewModelInitial extends AllDoctorsViewModelState {}

class AllDoctorsViewModelLoading extends AllDoctorsViewModelState {}

class AllDoctorsViewModelSuccess extends AllDoctorsViewModelState {
  final List<AllDoctorsModel> allDoctorsModel;
  AllDoctorsViewModelSuccess(this.allDoctorsModel);
}

class AllDoctorsViewModelError extends AllDoctorsViewModelState {

  String errorMessage;

  AllDoctorsViewModelError(this.errorMessage);
}