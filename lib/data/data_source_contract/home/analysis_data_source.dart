import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/AnalysisAiModel.dart';
import 'package:doctors/data/models/AnalysisBodyModel.dart';

abstract class AnalysisDataSource {
  Future<Either<AnalysisAiModel,String>> addAnalysis({required AnalysisBodyModel analysisBodyModel});
  }