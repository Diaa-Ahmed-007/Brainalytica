import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/home/emergancy_data_source.dart';
import 'package:doctors/data/models/home/emergancy_model/AddEmergancyModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EmergancyDataSource)
class EmergancyDataSourceImpl extends EmergancyDataSource {
  ApiManger apiManger;
  @factoryMethod
  EmergancyDataSourceImpl(this.apiManger);
  @override
  Future<Either<AddEmergancyModel, String>> addEmergancy(
      {required int patientId,
      required String name,
      required String phoneNumber,
      required String address}) async {
    try {
      var response = await apiManger.postBackEndRequest(
        endPoints: EndPoints.addEmergancyEndPoint(patientId: patientId),
        body: {
          "contactName": name,
          "phoneNumber": phoneNumber,
          "address": address
        });
    AddEmergancyModel addEmergancyModel =
        AddEmergancyModel.fromJson(response.data);
    return Left(addEmergancyModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
