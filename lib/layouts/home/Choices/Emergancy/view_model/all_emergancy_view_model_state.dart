import 'package:doctors/data/models/home/get_all_emergancy/GetAllEmergancy.dart';

class AllEmergancyViewModelState {}

class AllEmergancyViewModelStateInitial extends AllEmergancyViewModelState {}

class AllEmergancyViewModelStateLoading extends AllEmergancyViewModelState {}

class AllEmergancyViewModelStateSuccess extends AllEmergancyViewModelState {
  final GetAllEmergancyModel getAllEmergancyModel;

  AllEmergancyViewModelStateSuccess({required this.getAllEmergancyModel});
}
class AllEmergancyViewModelStateError extends AllEmergancyViewModelState {
  final String errorMessage;

  AllEmergancyViewModelStateError({required this.errorMessage});
}
