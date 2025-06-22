import 'dart:developer';

import 'package:doctors/core/reusable_componants/custom_text_field.dart';
import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:doctors/data/models/patient_login_model/patient_login_model.dart';
import 'package:doctors/layouts/home/Choices/add_data/view_model/add_patient_data_view_model.dart';
import 'package:doctors/layouts/home/Choices/add_data/view_model/add_patient_data_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitPatientDateScreen extends StatefulWidget {
  const InitPatientDateScreen({
    super.key,
  });

  @override
  State<InitPatientDateScreen> createState() => _InitPatientDateScreenState();
}

class _InitPatientDateScreenState extends State<InitPatientDateScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController pharmaceuticalController =
      TextEditingController();
  final TextEditingController chronicDiseasesController =
      TextEditingController();

  bool hadStroke = false;
  DateTime? strokeInjuryDate;
  String? selectedBloodType;
  bool bloodTransfusion = false;
  bool hadSurgery = false;

  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  // ✅ Validation Function
  bool validateFields(BuildContext context) {
    String? error;
    if (weightController.text.isEmpty) {
      error = 'Weight is required';
    } else if (selectedBloodType == null) {
      error = 'Blood Type is required';
    } else if (pharmaceuticalController.text.isEmpty) {
      error = 'Pharmaceutical field is required';
    } else if (chronicDiseasesController.text.isEmpty) {
      error = 'Chronic Diseases field is required';
    } else if (hadStroke && strokeInjuryDate == null) {
      error = 'Stroke injury date is required';
    }
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final PatientLoginModel patient =
        ModalRoute.of(context)?.settings.arguments as PatientLoginModel;
    return BlocListener<AddPatientDataViewModel, AddPatientDataViewModelState>(
      listener: (context, state) {
        if (state is AddPatientDataViewModelLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else {
          Navigator.pop(context); // Close loading if open
        }

        if (state is AddPatientDataViewModelSuccessState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Success"),
              content: const Text("Patient data added successfully."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Navigator.pushReplacementNamed(
                        context, Routes.xrayScreenRouteName);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        } else if (state is AddPatientDataViewModelErrorState) {
          log(state.errorMessage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.errorMessage}")),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Image.asset(
              Assets.assetsImagesPatientScreenBackground,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back_ios_new,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30),
                        ),
                        const Text(
                          "Patients",
                          style: TextStyle(
                              color: Color(0xffb8cfe1),
                              fontSize: 50,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.05),

                    // Had Stroke Switch
                    SwitchListTile(
                      title: Text(
                        "Had Stroke?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      activeColor: Theme.of(context).colorScheme.onSecondary,
                      value: hadStroke,
                      onChanged: (val) => setState(() => hadStroke = val),
                    ),
                    SizedBox(height: height * 0.02),

                    // Stroke Injury Date
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.5,
                        ),
                      ),
                      tileColor: Colors.white.withOpacity(0.1),
                      title: Text(
                        strokeInjuryDate == null
                            ? 'Select Stroke Injury Date'
                            : 'Date: ${strokeInjuryDate!.toLocal().toString().split(' ')[0]}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary:
                                      Theme.of(context).colorScheme.primary,
                                  onPrimary: Colors.white,
                                  onSurface:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setState(() => strokeInjuryDate = picked);
                        }
                      },
                    ),
                    SizedBox(height: height * 0.02),

                    // Weight
                    CustomTextField(
                      hintText: 'Weight (kg)',
                      keyboard: TextInputType.number,
                      textController: weightController,
                    ),
                    SizedBox(height: height * 0.04),

                    // Blood Type
                    DropdownButtonFormField<String>(
                      value: selectedBloodType,
                      items: bloodTypes
                          .map((type) => DropdownMenuItem(
                                value: type,
                                child: Text(
                                  type,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (val) =>
                          setState(() => selectedBloodType = val),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Blood Type',
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      dropdownColor: Theme.of(context).colorScheme.secondary,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.04),

                    // Blood Transfusion Switch
                    SwitchListTile(
                      title: Text(
                        "Received Blood Transfusion?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      activeColor: Theme.of(context).colorScheme.onSecondary,
                      value: bloodTransfusion,
                      onChanged: (val) =>
                          setState(() => bloodTransfusion = val),
                    ),
                    SizedBox(height: height * 0.02),

                    // Pharmaceutical
                    CustomTextField(
                      hintText: 'Pharmaceutical',
                      keyboard: TextInputType.text,
                      textController: pharmaceuticalController,
                    ),
                    SizedBox(height: height * 0.04),

                    // Chronic Diseases
                    CustomTextField(
                      hintText: 'Chronic Diseases',
                      keyboard: TextInputType.text,
                      textController: chronicDiseasesController,
                    ),
                    SizedBox(height: height * 0.04),

                    // Had Surgery Switch
                    SwitchListTile(
                      title: Text(
                        "Had Surgery?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      activeColor: Theme.of(context).colorScheme.onSecondary,
                      value: hadSurgery,
                      onChanged: (val) => setState(() => hadSurgery = val),
                    ),
                    SizedBox(height: height * 0.05),

                    // Submit
                    InkWell(
                      onTap: () {
                        if (!validateFields(context)) return;
                        context.read<AddPatientDataViewModel>().addPatientData(
                              weight: double.tryParse(weightController.text) ??
                                  50.0,
                              pharmaceutical: pharmaceuticalController.text,
                              chronicDiseases: chronicDiseasesController.text,
                              hadStroke: hadStroke,
                              strokeInjuryDate:
                                  (strokeInjuryDate ?? DateTime.now())
                                      .toIso8601String()
                                      .split('T')
                                      .first,
                              bloodType: selectedBloodType ?? "O+",
                              bloodTransfusion: bloodTransfusion,
                              hadSurgery: hadSurgery,
                              patientId: patient.user?.patientId?.toInt() ?? 0,
                            );
                      },
                      child: Container(
                        height: height * 0.1,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                              size: 50),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
