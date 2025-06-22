import 'package:doctors/data/data_source_contract/home/emergancy_data_source.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/view_model/all_emergancy_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllEmergancyViewModel extends Cubit<AllEmergancyViewModelState> {
  AllEmergancyViewModel(this.emergancyDataSource)
      : super(AllEmergancyViewModelStateInitial());
  @factoryMethod
  EmergancyDataSource emergancyDataSource;
  Future<void> loadEmergencies() async {
    emit(AllEmergancyViewModelStateLoading());
    var result = await emergancyDataSource.getAllEmergancy();
    result.fold(
      (emergencies) => emit(
          AllEmergancyViewModelStateSuccess(getAllEmergancyModel: emergencies)),
      (error) => emit(AllEmergancyViewModelStateError(errorMessage: error)),
    );
  }
}
