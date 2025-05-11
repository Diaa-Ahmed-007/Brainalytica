// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manger.dart' as _i993;
import '../data/data_source_contract/doctor/doctor_login_data_source.dart'
    as _i1041;
import '../data/data_source_contract/home/get_all_doctors_data_source.dart'
    as _i738;
import '../data/data_source_contract/home/xray_data_source.dart' as _i483;
import '../data/data_source_contract/patient/patient_login_data_source.dart'
    as _i755;
import '../data/data_source_contract/patient/patient_register_data_source.dart'
    as _i151;
import '../data/data_source_impl/doctor/doctor_login_data_source_impl.dart'
    as _i279;
import '../data/data_source_impl/home/get_all_doctors_data_source_impl.dart'
    as _i599;
import '../data/data_source_impl/home/xray_data_source_impl.dart' as _i782;
import '../data/data_source_impl/patient/patient_login_data_source_impl.dart'
    as _i693;
import '../data/data_source_impl/patient/patient_register_data_source_impl.dart'
    as _i57;
import '../layouts/Flows/Patients/view_model/sign_up_view_model.dart' as _i796;
import '../layouts/home/Choices/Doctors/view_model/all_doctors_view_model.dart'
    as _i859;
import '../layouts/home/Choices/patient/Xray/view_model/xray_view_model.dart'
    as _i219;
import '../layouts/login/view_model/doctor_login_view_model.dart' as _i567;
import '../layouts/login/view_model/patient_login_view_model.dart' as _i472;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i993.ApiManger>(() => _i993.ApiManger());
    gh.factory<_i1041.DoctorLoginDataSource>(
        () => _i279.DoctorLoginDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i755.PatientLoginDataSource>(
        () => _i693.PatientLoginDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i483.XrayDataSource>(
        () => _i782.XrayDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i151.PatientRegisterDataSource>(
        () => _i57.PatientRegisterDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i738.GetAllDoctorsDataSource>(
        () => _i599.GetAllDoctorsDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i796.PatientRegisterViewModel>(() =>
        _i796.PatientRegisterViewModel(gh<_i151.PatientRegisterDataSource>()));
    gh.factory<_i472.PatientLoginViewModel>(
        () => _i472.PatientLoginViewModel(gh<_i755.PatientLoginDataSource>()));
    gh.factory<_i567.DoctorLoginViewModel>(
        () => _i567.DoctorLoginViewModel(gh<_i1041.DoctorLoginDataSource>()));
    gh.factory<_i859.AllDoctorsViewModel>(
        () => _i859.AllDoctorsViewModel(gh<_i738.GetAllDoctorsDataSource>()));
    gh.factory<_i219.XrayViewModel>(
        () => _i219.XrayViewModel(gh<_i483.XrayDataSource>()));
    return this;
  }
}
