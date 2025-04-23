import 'package:doctors/data/data_source_contract/home/get_all_doctors_data_source.dart';
import 'package:doctors/layouts/home/Choices/Doctors/view_model/all_doctors_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class AllDoctorsViewModel extends Cubit<AllDoctorsViewModelState> {
  GetAllDoctorsDataSource getAllDoctorsDataSource;
  @factoryMethod
  AllDoctorsViewModel(this.getAllDoctorsDataSource) : super(AllDoctorsViewModelInitial());

  Future<void> getAllDoctors() async {
    emit(AllDoctorsViewModelLoading());
    final response = await getAllDoctorsDataSource.getAllDoctors();
    response.fold((allDoctorsModel) {
      emit(AllDoctorsViewModelSuccess(allDoctorsModel));
    }, (errorMessage) {
      emit(AllDoctorsViewModelError(errorMessage));
    });
  }
}