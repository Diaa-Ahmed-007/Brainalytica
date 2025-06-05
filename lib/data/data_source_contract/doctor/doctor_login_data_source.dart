import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/doctor_register_model/doctor_login_model.dart';

abstract class DoctorLoginDataSource {
  Future<Either<DoctorLoginModel, String>> doctorLogin(
      {required String emailAddress, required String password});
}
