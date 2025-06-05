import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/home/get_all_doctors_data_source.dart';
import 'package:doctors/data/models/doctor_register_model/AllDoctorsModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllDoctorsDataSource)
class GetAllDoctorsDataSourceImpl extends GetAllDoctorsDataSource {
  ApiManger apiManger;
  @factoryMethod
  GetAllDoctorsDataSourceImpl(this.apiManger);
  @override
  Future<Either<List<AllDoctorsModel>, String>> getAllDoctors() async {
    try {
      var response = await apiManger.getBackEndRequest(
          endPoints: EndPoints.getAllDoctorsEndPoint);
      List<AllDoctorsModel> allDoctorsModel = (response.data as List)
          .map((e) => AllDoctorsModel.fromJson(e))
          .toList();
      return Left(allDoctorsModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
