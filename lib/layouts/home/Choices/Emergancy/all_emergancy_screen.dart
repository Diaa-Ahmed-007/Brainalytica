import 'package:doctors/layouts/home/Choices/Emergancy/view_model/all_emergancy_view_model.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/view_model/all_emergancy_view_model_state.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/widgets/emergency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllEmergencyScreen extends StatefulWidget {
  const AllEmergencyScreen({super.key});

  @override
  State<AllEmergencyScreen> createState() => _AllEmergencyScreenState();
}

class _AllEmergencyScreenState extends State<AllEmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergencies'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: BlocBuilder<AllEmergancyViewModel, AllEmergancyViewModelState>(
        builder: (context, state) {
          if (state is AllEmergancyViewModelStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AllEmergancyViewModelStateError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }
          if (state is AllEmergancyViewModelStateSuccess) {
            final data = state.getAllEmergancyModel.data ?? [];
            if (data.isEmpty) {
              return const Center(
                child: Text(
                  "No emergency records found.",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return EmergencyCard(
                  contactName: item.contactName ?? "",
                  address: item.address ?? "",
                  contactPhone: item.phoneNumber ?? "",
                  firstName: item.firstName ?? "",
                  lastName: item.lastName ?? "",
                  email: item.emailAddress ?? "",
                  gender: item.gender ?? "",
                  birthDate: item.birthDate ?? "",
                  phoneNumber: item.phoneNumber2 ?? "",
                );
              },
            );
          }
          return const Center(
            child: Text(
              "Loading emergencies...",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
