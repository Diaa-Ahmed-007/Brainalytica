import 'package:doctors/data/data_source_contract/home/patient_analysis_data_source.dart';
import 'package:doctors/data/data_source_contract/patient/patient_data_source_contract.dart';
import 'package:doctors/layouts/home/Choices/patient/view_model/all_patient_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllPatientsViewModel extends Cubit<AllPatientsViewModelState> {
  PatientAnalysisDataSource patientAnalysisDataSource;
  @factoryMethod
  AllPatientsViewModel(this.patientAnalysisDataSource)
      : super(AllPatientsViewModelInitial());

  Future<void> getAllPatients() async {
    emit(AllPatientsViewModelLoading());
    final response = await patientAnalysisDataSource.getAllPatientsAnalysis();
    response.fold((allDoctorsModel) {
      emit(AllPatientsViewModelSuccess(allDoctorsModel));
    }, (errorMessage) {
      emit(AllPatientsViewModelError(errorMessage));
    });
  }
}
