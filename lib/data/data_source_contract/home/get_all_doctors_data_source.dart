import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/doctor_register_model/AllDoctorsModel.dart';

abstract class GetAllDoctorsDataSource {
  Future<Either<List<AllDoctorsModel>, String>> getAllDoctors();
}
