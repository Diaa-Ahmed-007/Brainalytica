import 'package:doctors/data/data_source_contract/home/emergancy_data_source.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/view_model/add_emergancy_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddEmergancyViewModel extends Cubit<AddEmergancyViewModelState> {
  AddEmergancyViewModel(this.emergancyDataSource)
      : super(AddEmergancyViewModelInitial());
  @factoryMethod
  EmergancyDataSource emergancyDataSource;

  Future<void> addEmergancy(
      {required int patientId,
      required String name,
      required String phoneNumber,
      required String address}) async {
    emit(AddEmergancyViewModelLoadingState());
    final result = await emergancyDataSource.addEmergancy(
        patientId: patientId,
        name: name,
        phoneNumber: phoneNumber,
        address: address);
    result.fold(
        (l) => emit(AddEmergancyViewModelSuccessState(addEmergancyModel: l)),
        (r) => emit(AddEmergancyViewModelErrorState(errorMessage: r)));
  }
}
