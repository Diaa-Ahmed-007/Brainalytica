import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/home/emergancy_model/AddEmergancyModel.dart';

abstract class EmergancyDataSource {
  Future<Either<AddEmergancyModel, String>> addEmergancy({required int patientId,required String name,required String phoneNumber,required String address});
}