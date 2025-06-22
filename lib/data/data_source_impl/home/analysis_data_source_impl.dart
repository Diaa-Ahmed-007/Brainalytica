
import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/home/analysis_data_source.dart';
import 'package:doctors/data/models/AnalysisAiModel.dart';
import 'package:doctors/data/models/AnalysisBodyModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AnalysisDataSource)
class AnalysisDataSourceImpl extends AnalysisDataSource {
  ApiManger apiManger;
  @factoryMethod
  AnalysisDataSourceImpl(this.apiManger);
  @override
  Future<Either<AnalysisAiModel, String>> addAnalysis(
      {required AnalysisBodyModel analysisBodyModel}) async {
    try {
      var response = await apiManger.postAnalysisAiModelRequest(
          endPoints: EndPoints.addAnalysisEndPoint,
          body: {
            "gender": analysisBodyModel.gender,
            "age": analysisBodyModel.age,
            "hypertension": analysisBodyModel.hypertension,
            "heart_disease": analysisBodyModel.heartDisease,
            "ever_married": analysisBodyModel.everMarried,
            "work_type": analysisBodyModel.workType,
            "Residence_type": analysisBodyModel.residenceType,
            "avg_glucose_level": analysisBodyModel.avgGlucoseLevel,
            "bmi": analysisBodyModel.bmi,
            "smoking_status": analysisBodyModel.smokingStatus
          }
          );
      AnalysisAiModel analysisAiModel = AnalysisAiModel.fromJson(response.data);
      return Left(analysisAiModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
