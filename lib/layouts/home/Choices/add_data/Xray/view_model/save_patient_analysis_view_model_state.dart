import 'package:doctors/data/models/home/save_patient_analysis_model/SavePatientAnalysisModel.dart';

abstract class SavePatientAnalysisViewModelState {
  


}

class SavePatientAnalysisInitialState extends SavePatientAnalysisViewModelState {

}

class SavePatientAnalysisLoadingState extends SavePatientAnalysisViewModelState {

}

class SavePatientAnalysisSuccessState extends SavePatientAnalysisViewModelState {
  final SavePatientAnalysisModel savePatientAnalysisModel;

  SavePatientAnalysisSuccessState(this.savePatientAnalysisModel);
}

class SavePatientAnalysisErrorState extends SavePatientAnalysisViewModelState {
  final String errorMessage;

  SavePatientAnalysisErrorState(this.errorMessage);
}