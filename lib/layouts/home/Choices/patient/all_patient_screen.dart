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
              itemCount: state.getAllPatientModel.data?.length,
              itemBuilder: (context, index) {
                final patient = state.getAllPatientModel.data?[index];
                return PatientCard(
                  firstName: patient?.patient?.firstName ?? "Unknown",
                  lastName: patient?.patient?.lastName ?? "Unknown",
                  email: patient?.patient?.emailAddress ?? "Unknown",
                  birthDate: patient?.patient?.birthDate ?? "Unknown",
                  phoneNumber: patient?.patient?.phoneNumber ?? "Unknown",
                  pharmaceutical: patient?.pharmaceutical ?? "Unknown",
                  chronicDiseases: patient?.chronicDiseases ?? "Unknown",
                  strokeInjuryDate: patient?.strokeInjuryDate ?? "Unknown",
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
