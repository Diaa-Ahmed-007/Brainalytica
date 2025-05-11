import 'package:dartz/dartz.dart';
import 'package:doctors/layouts/Flows/doctors/doctor_register.dart';
abstract class DoctorRegisterDataSource {
  Future<Either<DoctorRegister, String>> registerPatient({required String firstName, required String lastName, required String gender, required String birthDate, required String emailAddress, required String phoneNumber, required String password,required String specialization,required String address});
}