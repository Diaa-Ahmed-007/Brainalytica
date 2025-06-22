import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/home/patient_analysis_data_source.dart';
import 'package:doctors/data/models/home/patients_analysis/get_all_patients_analysis_model/GetAllPatientsAnalysisModel.dart';
import 'package:doctors/data/models/home/patients_analysis/get_patient_analysis_model/GetPatientAnalysisModel.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:  PatientAnalysisDataSource)
class PatientAnalysisDataSourceImpl extends PatientAnalysisDataSource {
  ApiManger apiManger;
  @factoryMethod
  PatientAnalysisDataSourceImpl(this.apiManger);
  @override
  Future<Either<GetAllPatientsAnalysisModel, String>> getAllPatientsAnalysis() async {
    try {
      var response =await apiManger.getBackEndRequest(
        endPoints: EndPoints.getPredictionResult,
      );
       GetAllPatientsAnalysisModel getAllPatientsAnalysisModel =
            GetAllPatientsAnalysisModel.fromJson(response.data);
      return Left(getAllPatientsAnalysisModel);
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<GetPatientAnalysisModel, String>> getPatientByToken({required String token}) async {
    try {
      var response =await apiManger.getBackEndRequest(
      endPoints: EndPoints.getPredictionResultById,header: {'Authorization': "Bearer $token"}
    );
    GetPatientAnalysisModel getPatientAnalysisModel =
        GetPatientAnalysisModel.fromJson(response.data);
    return Left(getPatientAnalysisModel);
    } catch (e) {
      return Right(e.toString());
    }

  }
  
}