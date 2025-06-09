import 'package:doctors/layouts/Flows/Patients/provider/Patient_register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderChoose extends StatefulWidget {
  const GenderChoose({
    super.key,
  });

  @override
  State<GenderChoose> createState() => _GenderChooseState();
}

class _GenderChooseState extends State<GenderChoose> {
  @override
  Widget build(BuildContext context) {
    PatientRegisterProvider patientRegisterProvider =
        Provider.of<PatientRegisterProvider>(context);

    return Expanded(
      child: GestureDetector(
        onTap: _openGenderSelection,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(patientRegisterProvider.selectedGender ?? "Select Gender",
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  void _openGenderSelection() {
    PatientRegisterProvider patientRegisterProvider =
        Provider.of<PatientRegisterProvider>(context, listen: false);

    showModalBottomSheet(
      backgroundColor: const Color(0xffADC5D0),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: Column(
            children: [
              const Text("Select Gender",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              RadioListTile<String>(
                title: const Text("Male"),
                value: "Male",
                groupValue: patientRegisterProvider.selectedGender,
                onChanged: (value) {
                  setState(
                      () => patientRegisterProvider.selectedGender = value);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text("Female"),
                value: "Female",
                groupValue: patientRegisterProvider.selectedGender,
                onChanged: (value) {
                  setState(
                      () => patientRegisterProvider.selectedGender = value);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
