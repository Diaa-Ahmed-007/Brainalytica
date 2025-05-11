import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/home/xray_data_source.dart';
import 'package:doctors/data/models/XrayResponseModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: XrayDataSource)
class XrayDataSourceImpl extends XrayDataSource {
  ApiManger apiManger;
  @factoryMethod
  XrayDataSourceImpl(this.apiManger);
  @override
  Future<Either<XrayResponseModel, String>> uploadXray(
      {required String file}) async {
    try {
      var response = await apiManger.postAiModelRequest(
          endPoints: EndPoints.xrayEndPoint, imageFile: file);
      XrayResponseModel xrayResponseModel =
          XrayResponseModel.fromJson(response.data);
      return Left(xrayResponseModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
