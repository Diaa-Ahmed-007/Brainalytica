import 'package:doctors/layouts/home/Choices/patient/view_model/all_patient_view_model.dart';
import 'package:doctors/layouts/home/Choices/patient/view_model/all_patient_view_model_state.dart';
import 'package:doctors/layouts/home/Choices/patient/widgets/PatientCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPatientScreen extends StatelessWidget {
  const AllPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patients Records"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: BlocBuilder<AllPatientsViewModel, AllPatientsViewModelState>(
        builder: (context, state) {
          if (state is AllPatientsViewModelLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AllPatientsViewModelError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is AllPatientsViewModelSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: state.getAllPatientsAnalysisModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                final result = state.getAllPatientsAnalysisModel.data![index];
                final pred = result.strokePrediction;
                final patient = pred?.patient;

                return PatientCard(
                  result: result.result ?? "Unknown",
                  probability: (result.probability is int)
                      ? (result.probability as int).toDouble()
                      : result.probability?.toDouble(),
                  createdAt: result.createdAt ?? "",
                  firstName: patient?.firstName ?? "Unknown",
                  lastName: patient?.lastName ?? "Unknown",
                  email: patient?.emailAddress ?? "Unknown",
                  birthDate: patient?.birthDate ?? "Unknown",
                  phoneNumber: patient?.phoneNumber ?? "Unknown",
                  age: pred?.age?.toInt(),
                  gender: pred?.gender,
                  hypertension: pred?.hypertension,
                  heartDisease: pred?.heartDisease,
                  workType: pred?.workType,
                  residenceType: pred?.residenceType,
                  avgGlucoseLevel: pred?.avgGlucoseLevel?.toDouble(),
                  bmi: pred?.bmi?.toDouble(),
                  smokingStatus: pred?.smokingStatus,
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
