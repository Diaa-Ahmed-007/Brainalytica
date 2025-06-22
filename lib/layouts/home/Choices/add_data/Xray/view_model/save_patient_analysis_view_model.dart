import 'dart:developer';

import 'package:doctors/data/data_source_contract/home/add_patient_analysis_data_source.dart';
import 'package:doctors/data/models/AnalysisAiModel.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/view_model/save_patient_analysis_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SavePatientAnalysisViewModel
    extends Cubit<SavePatientAnalysisViewModelState> {
  SavePatientAnalysisViewModel(this.addPatientAnalysisDataSource)
      : super(SavePatientAnalysisInitialState());
  @factoryMethod
  AddPatientAnalysisDataSource addPatientAnalysisDataSource;

  Future<void> savePatientAnalysis(
      {required String token, required AnalysisAiModel analysisAiModel}) async {
    emit(SavePatientAnalysisLoadingState());
    final response = await addPatientAnalysisDataSource.addPatientAnalysis(
        token: token, analysisAiModel: analysisAiModel);
    response.fold(
      (success) => emit(SavePatientAnalysisSuccessState(success)),
      (error) {
        log('Error saving patient analysis: $error');
        emit(SavePatientAnalysisErrorState(error));
      },
    );
  }
}
