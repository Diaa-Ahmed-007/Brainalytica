import 'package:doctors/data/data_source_contract/patient/patient_data_source_contract.dart';
import 'package:doctors/layouts/home/Choices/add_data/view_model/add_patient_data_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddPatientDataViewModel extends Cubit<AddPatientDataViewModelState> {
  PatientDataSource patientDataSource;
  @factoryMethod
  AddPatientDataViewModel(this.patientDataSource) : super(AddPatientDataViewModelInitial());

  Future<void> addPatientData({required bool hadStroke,
      required String strokeInjuryDate,
      required double weight,
      required String bloodType,
      required bool bloodTransfusion,
      required String pharmaceutical,
      required String chronicDiseases,
      required bool hadSurgery,
      required int patientId}) async {
    emit(AddPatientDataViewModelLoadingState());
    final response = await patientDataSource.addPatientData(bloodTransfusion: bloodTransfusion,bloodType: bloodType,chronicDiseases: chronicDiseases,hadSurgery: hadSurgery,hadStroke: hadStroke,patientId: patientId,pharmaceutical: pharmaceutical,strokeInjuryDate: strokeInjuryDate,weight: weight);
    response.fold((addPatientDataModel) {
      emit(AddPatientDataViewModelSuccessState(addPatientDateModel: addPatientDataModel));
    }, (errorMessage) {
      emit(AddPatientDataViewModelErrorState(errorMessage:  errorMessage));
    });
  }
}