import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/doctor_register_model/doctor_register_model.dart';

abstract class DoctorRegisterDataSource {
  Future<Either<DoctorRegisterModel, String>> registerPatient(
      {required String firstName,
      required String lastName,
      required String gender,
      required String birthDate,
      required String emailAddress,
      required String phoneNumber,
      required String password,
      required String specialization,
      required String address});
}
