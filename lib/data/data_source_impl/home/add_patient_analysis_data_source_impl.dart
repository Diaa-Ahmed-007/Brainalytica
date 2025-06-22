import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/home/add_patient_analysis_data_source.dart';
import 'package:doctors/data/models/AnalysisAiModel.dart';
import 'package:doctors/data/models/home/save_patient_analysis_model/SavePatientAnalysisModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddPatientAnalysisDataSource)
class AddPatientAnalysisDataSourceImpl extends AddPatientAnalysisDataSource {
  ApiManger apiManger;
  @factoryMethod
  AddPatientAnalysisDataSourceImpl(this.apiManger);

  @override
  Future<Either<SavePatientAnalysisModel, String>> addPatientAnalysis(
      {required AnalysisAiModel analysisAiModel, required String token}) async {
    try {
      var response = await apiManger
          .postBackEndRequest(endPoints: EndPoints.addPredictionResult, body: {
        "result": analysisAiModel.prediction,
        "probability": analysisAiModel.probability,
      }, headers: {
        'Authorization': "Bearer $token"
      });
      SavePatientAnalysisModel savePatientAnalysisModel =
          SavePatientAnalysisModel.fromJson(response.data);
      if (savePatientAnalysisModel.success == false) {
        return Right(
            savePatientAnalysisModel.message ?? "Unknown error occurred");
      }
      ;
      return Left(savePatientAnalysisModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
