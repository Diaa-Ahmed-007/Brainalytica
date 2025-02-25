import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/patient_model.dart';

abstract class PatientRegisterDataSource {
  Future<Either<PatientModel, String>> registerPatient();
}
