import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/patient_register_model/patient_register_model.dart';

abstract class PatientRegisterDataSource {
  Future<Either<PatientModel, String>> registerPatient(
      {required String firstName,
      required String lastName,
      required String gender,
      required String birthDate,
      required String emailAddress,
      required String phoneNumber,
      required String password});
}
