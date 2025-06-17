import 'package:doctors/data/models/AnalysisAiModel.dart';

abstract class AnalysisViewModelState {
  
}

class AnalysisViewModelInitial extends AnalysisViewModelState {}


class AnalysisViewModelSuccess extends AnalysisViewModelState {
  AnalysisViewModelSuccess(this.analysisResponseModel);
  final AnalysisAiModel analysisResponseModel;
  
}

class AnalysisViewModelError extends AnalysisViewModelState {
  AnalysisViewModelError(this.error);
  final String error;
}

class AnalysisViewModelLoading extends AnalysisViewModelState {
  
}