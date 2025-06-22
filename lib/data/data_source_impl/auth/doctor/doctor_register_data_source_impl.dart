import 'package:dartz/dartz.dart';
import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/api/end_points.dart';
import 'package:doctors/data/data_source_contract/doctor/doctor_register_data_source.dart';
import 'package:doctors/data/models/doctor_register_model/doctor_register_model.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: DoctorRegisterDataSource)
class DoctorRegisterDataSourceImpl extends DoctorRegisterDataSource {
  ApiManger apiManger;

  @factoryMethod
  DoctorRegisterDataSourceImpl(this.apiManger);

  @override
  Future<Either<DoctorRegisterModel, String>> registerPatient({required String firstName, required String lastName, required String gender, required String birthDate, required String emailAddress, required String phoneNumber, required String password, required String specialization, required String address}) async {
    try {
      var response =await apiManger.postBackEndRequest(
        endPoints: EndPoints.doctorRegisterEndPoint,
        body: {
            "first_Name": firstName,
            "last_Name": lastName,
            "gender": gender,
            "birth_Date": birthDate,
            "email_Address": emailAddress,
            "phone_Number": phoneNumber,
            "specialization": specialization,
            "address": address,
            "password": password
        });
      DoctorRegisterModel doctorRegister = DoctorRegisterModel.fromJson(response.data);
      return Left(doctorRegister);
  }
  catch (e) {
      return Right(e.toString());
    }
  }

  
  
}