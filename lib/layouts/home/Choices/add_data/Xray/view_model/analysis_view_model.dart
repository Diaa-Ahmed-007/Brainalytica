import 'package:doctors/data/data_source_contract/home/analysis_data_source.dart';
import 'package:doctors/data/models/AnalysisBodyModel.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/view_model/analysis_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AnalysisViewModel extends Cubit<AnalysisViewModelState> {
  AnalysisViewModel(this.analysisDataSource)
      : super(AnalysisViewModelInitial());
  @factoryMethod
  AnalysisDataSource analysisDataSource;

  Future<void> addAnalysis(
      {required AnalysisBodyModel analysisBodyModel}) async {
    emit(AnalysisViewModelLoading());
    final response = await analysisDataSource.addAnalysis(
        analysisBodyModel: analysisBodyModel);
    response.fold((l) => emit(AnalysisViewModelSuccess(l)), (r) {
      emit(AnalysisViewModelError(r));
    });
  }
}
