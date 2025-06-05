import 'package:doctors/data/data_source_contract/patient/patient_data_source_contract.dart';
import 'package:doctors/layouts/home/Choices/patient/view_model/all_patient_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllPatientsViewModel extends Cubit<AllPatientsViewModelState> {
  PatientDataSource patientDataSource;
  @factoryMethod
  AllPatientsViewModel(this.patientDataSource)
      : super(AllPatientsViewModelInitial());

  Future<void> getAllPatients() async {
    emit(AllPatientsViewModelLoading());
    final response = await patientDataSource.getAllPatient();
    response.fold((allDoctorsModel) {
      emit(AllPatientsViewModelSuccess(allDoctorsModel));
    }, (errorMessage) {
      emit(AllPatientsViewModelError(errorMessage));
    });
  }
}
