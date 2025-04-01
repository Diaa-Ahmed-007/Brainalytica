import 'package:dartz/dartz.dart';
import 'package:doctors/data/models/patient_login_model/patient_login_model.dart';

abstract class PatientLoginDataSource {
  Future<Either<PatientLoginModel,String>>patientLogin({required String emailAddress,required String password});
}