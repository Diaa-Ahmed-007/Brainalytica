import 'dart:developer';

import 'package:doctors/data/models/AnalysisBodyModel.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/view_model/analysis_view_model.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/view_model/analysis_view_model_state.dart';
import 'package:doctors/layouts/home/Choices/add_data/provider/analysis_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AddAnalysisData extends StatelessWidget {
  const AddAnalysisData({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController ageController =
        TextEditingController(text: '85');
    final TextEditingController glucoseController =
        TextEditingController(text: '450');
    final TextEditingController bmiController =
        TextEditingController(text: '52');
    var provider = Provider.of<AnalysisDataProvider>(context);
    String gender = 'Male';
    String hypertension = 'Yes';
    String heartDisease = 'Yes';
    String everMarried = 'Yes';
    String workType = 'Self-employed';
    String residenceType = 'Urban';
    String smokingStatus = 'smokes';
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: BlocListener<AnalysisViewModel, AnalysisViewModelState>(
        listener: (context, state) {
          if (state is AnalysisViewModelSuccess) {
            log(state.analysisResponseModel.prediction ?? "");
            provider.setPrediction(
              state.analysisResponseModel.prediction ?? "",
            );
            provider.setProbability(
              state.analysisResponseModel.probability?.toDouble() ?? 0.0,
            );
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Analysis saved successfully!')),
            );
          }
          if (state is AnalysisViewModelError) {
            log("Error: ${state.error}");
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.error),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
          Navigator.pop(context);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Add Analysis Data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: gender,
                items: ['Male', 'Female']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => gender = val!,
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Age')),
              DropdownButtonFormField<String>(
                value: hypertension,
                items: ['Yes', 'No']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => hypertension = val!,
                decoration: const InputDecoration(labelText: 'Hypertension'),
              ),
              DropdownButtonFormField<String>(
                value: heartDisease,
                items: ['Yes', 'No']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => heartDisease = val!,
                decoration: const InputDecoration(labelText: 'Heart Disease'),
              ),
              DropdownButtonFormField<String>(
                value: everMarried,
                items: ['Yes', 'No']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => everMarried = val!,
                decoration: const InputDecoration(labelText: 'Ever Married'),
              ),
              DropdownButtonFormField<String>(
                value: workType,
                items: [
                  'Private',
                  'Self-employed',
                  'Govt_job',
                  'Children',
                  'Never_worked'
                ]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => workType = val!,
                decoration: const InputDecoration(labelText: 'Work Type'),
              ),
              DropdownButtonFormField<String>(
                value: residenceType,
                items: ['Urban', 'Rural']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => residenceType = val!,
                decoration: const InputDecoration(labelText: 'Residence Type'),
              ),
              TextFormField(
                  controller: glucoseController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Avg Glucose Level')),
              TextFormField(
                  controller: bmiController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'BMI')),
              DropdownButtonFormField<String>(
                value: smokingStatus,
                items: ['never smoked', 'formerly smoked', 'smokes', 'Unknown']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => smokingStatus = val!,
                decoration: const InputDecoration(labelText: 'Smoking Status'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AnalysisViewModel>(context).addAnalysis(
                    analysisBodyModel: AnalysisBodyModel(
                      gender: gender,
                      hypertension: hypertension,
                      heartDisease: heartDisease,
                      age: int.parse(ageController.text),
                      everMarried: everMarried,
                      residenceType: residenceType,
                      smokingStatus: smokingStatus,
                      workType: workType,
                      bmi: double.parse(bmiController.text),
                      avgGlucoseLevel: double.parse(glucoseController.text),
                    ),
                  );
                },
                child: const Text("Save Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
