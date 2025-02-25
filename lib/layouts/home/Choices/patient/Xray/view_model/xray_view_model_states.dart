import 'package:doctors/data/models/XrayResponseModel.dart';

sealed class XrayViewModelState {}

final class XrayViewModelInitial extends XrayViewModelState {}

final class XrayViewModeLoading extends XrayViewModelState {}

final class XrayViewModeSuccess extends XrayViewModelState {
  XrayResponseModel xrayResponseModel;
  XrayViewModeSuccess(this.xrayResponseModel);
}

final class XrayViewModeError extends XrayViewModelState {
  String error;
  XrayViewModeError(this.error);
}
