import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/XrayResponseModel.dart';

abstract class XrayDataSource {
  Future<Either<XrayResponseModel, String>> uploadXray({required String file});
}
