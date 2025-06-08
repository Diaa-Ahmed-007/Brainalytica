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
import '../data/data_source_contract/home/emergancy_data_source.dart' as _i992;
import '../data/data_source_contract/home/get_all_doctors_data_source.dart'
    as _i738;
import '../data/data_source_contract/home/xray_data_source.dart' as _i483;
import '../data/data_source_contract/patient/patient_data_source_contract.dart'
    as _i93;
import '../data/data_source_contract/patient/patient_login_data_source.dart'
    as _i755;
import '../data/data_source_contract/patient/patient_register_data_source.dart'
    as _i151;
import '../data/data_source_impl/auth/doctor/doctor_login_data_source_impl.dart'
    as _i670;
import '../data/data_source_impl/auth/patient/patient_login_data_source_impl.dart'
    as _i951;
import '../data/data_source_impl/auth/patient/patient_register_data_source_impl.dart'
    as _i841;
import '../data/data_source_impl/home/emergancy_data_source_impl.dart' as _i842;
import '../data/data_source_impl/home/get_all_doctors_data_source_impl.dart'
    as _i599;
import '../data/data_source_impl/home/patient/patient_data_source.dart'
    as _i596;
import '../data/data_source_impl/home/xray_data_source_impl.dart' as _i782;
import '../layouts/Flows/Patients/view_model/sign_up_view_model.dart' as _i796;
import '../layouts/home/Choices/add_data/view_model/add_patient_data_view_model.dart'
    as _i535;
import '../layouts/home/Choices/add_data/Xray/view_model/xray_view_model.dart'
    as _i955;
import '../layouts/home/Choices/Doctors/view_model/all_doctors_view_model.dart'
    as _i859;
import '../layouts/home/Choices/Emergancy/view_model/add_emergancy_view_model.dart'
    as _i222;
import '../layouts/home/Choices/patient/view_model/all_patient_view_model.dart'
    as _i929;
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
    gh.factory<_i992.EmergancyDataSource>(
        () => _i842.EmergancyDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i151.PatientRegisterDataSource>(
        () => _i841.PatientRegisterDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i483.XrayDataSource>(
        () => _i782.XrayDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i93.PatientDataSource>(
        () => _i596.PatientDataSourceimpl(gh<_i993.ApiManger>()));
    gh.factory<_i738.GetAllDoctorsDataSource>(
        () => _i599.GetAllDoctorsDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i755.PatientLoginDataSource>(
        () => _i951.PatientLoginDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i1041.DoctorLoginDataSource>(
        () => _i670.DoctorLoginDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i796.PatientRegisterViewModel>(() =>
        _i796.PatientRegisterViewModel(gh<_i151.PatientRegisterDataSource>()));
    gh.factory<_i472.PatientLoginViewModel>(
        () => _i472.PatientLoginViewModel(gh<_i755.PatientLoginDataSource>()));
    gh.factory<_i567.DoctorLoginViewModel>(
        () => _i567.DoctorLoginViewModel(gh<_i1041.DoctorLoginDataSource>()));
    gh.factory<_i859.AllDoctorsViewModel>(
        () => _i859.AllDoctorsViewModel(gh<_i738.GetAllDoctorsDataSource>()));
    gh.factory<_i929.AllPatientsViewModel>(
        () => _i929.AllPatientsViewModel(gh<_i93.PatientDataSource>()));
    gh.factory<_i535.AddPatientDataViewModel>(
        () => _i535.AddPatientDataViewModel(gh<_i93.PatientDataSource>()));
    gh.factory<_i222.AddEmergancyViewModel>(
        () => _i222.AddEmergancyViewModel(gh<_i992.EmergancyDataSource>()));
    gh.factory<_i955.XrayViewModel>(
        () => _i955.XrayViewModel(gh<_i483.XrayDataSource>()));
    return this;
  }
}
