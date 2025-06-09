import 'package:doctors/data/data_source_contract/home/xray_data_source.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/view_model/xray_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class XrayViewModel extends Cubit<XrayViewModelState> {
  XrayDataSource xrayDataSource;
  @factoryMethod
  XrayViewModel(this.xrayDataSource) : super(XrayViewModelInitial());
  static XrayViewModel get(BuildContext context) => BlocProvider.of(context);
  upload({
    required String filePath,
  }) async {
    emit(XrayViewModeLoading());
    var response = await xrayDataSource.uploadXray(
      file: filePath,
    );
    response.fold((success) {
      emit(XrayViewModeSuccess(success));
    }, (error) {
      emit(XrayViewModeError(error));
    });
  }
}
