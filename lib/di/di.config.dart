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
import '../data/data_source_contract/patient_register_data_source.dart'
    as _i442;
import '../data/data_source_contract/xray_data_source.dart' as _i440;
import '../data/data_source_impl/patient_register_data_source_impl.dart'
    as _i541;
import '../data/data_source_impl/xray_data_source_impl.dart' as _i248;
import '../layouts/home/Choices/patient/Xray/view_model/xray_view_model.dart'
    as _i219;

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
    gh.factory<_i442.PatientRegisterDataSource>(
        () => _i541.PatientRegisterDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i440.XrayDataSource>(
        () => _i248.XrayDataSourceImpl(gh<_i993.ApiManger>()));
    gh.factory<_i219.XrayViewModel>(
        () => _i219.XrayViewModel(gh<_i440.XrayDataSource>()));
    return this;
  }
}
