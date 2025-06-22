import 'package:doctors/core/reusable_componants/custom_text_field.dart';
import 'package:doctors/core/utils/dialogs.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:doctors/layouts/Flows/doctors/view_model/doctor_register_view_model.dart';
import 'package:doctors/layouts/Flows/doctors/view_model/doctor_register_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DoctorRegister extends StatefulWidget {
  const DoctorRegister({super.key});

  @override
  State<DoctorRegister> createState() => _DoctorRegisterState();
}

class _DoctorRegisterState extends State<DoctorRegister> {
  String? _selectedGender;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController(); // will use as birth date
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    majorController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _openGenderSelection() {
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
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() => _selectedGender = value);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text("Female"),
                value: "Female",
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() => _selectedGender = value);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ==== Date Picker Logic ====
  Future<void> _selectBirthDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              onSurface: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      String formatted = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        ageController.text = formatted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocListener<DoctorRegisterViewModel, DoctorRegisterViewModelState>(
      listener: (context, state) {
        if (state is DoctorRegisterLoadingState) {
          CustomDialogs.showLoadingDialog(context);
        } else {
          CustomDialogs.closeDialogs(context);
        }
        if (state is DoctorRegisterErrorState) {
          CustomDialogs.showErrorDialog(context, state.errorMessage);
        }
        if (state is DoctorRegisterSuccessState) {
          CustomDialogs.showSuccessDialog(
            context,
            'Registration completed successfully!',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.flowscreenRouteName,
                (route) => false,
              );
            },
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
          ),
          centerTitle: true,
          title: const Text(
            "Brianalytica",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: height * 0.1),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        hintText: "First Name",
                        keyboard: TextInputType.name,
                        textController: firstNameController),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                        hintText: "Last Name",
                        keyboard: TextInputType.name,
                        textController: lastNameController),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),

              // ==== Birth Date ====
              GestureDetector(
                onTap: () => _selectBirthDate(context),
                child: AbsorbPointer(
                  child: CustomTextField(
                    hintText: "Birth Date (yyyy-mm-dd)",
                    keyboard: TextInputType.datetime,
                    textController: ageController,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _openGenderSelection,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 14),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_selectedGender ?? "Select Gender",
                                style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                        hintText: "Phone number",
                        keyboard: TextInputType.number,
                        textController: phoneController),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        hintText: "Major",
                        keyboard: TextInputType.name,
                        textController: majorController),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                        hintText: "Address",
                        keyboard: TextInputType.name,
                        textController: addressController),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(
                  hintText: "Email",
                  keyboard: TextInputType.emailAddress,
                  textController: emailController),
              SizedBox(height: height * 0.02),
              CustomTextField(
                  hintText: "Password",
                  keyboard: TextInputType.visiblePassword,
                  obscureText: true,
                  textController: passwordController),
              SizedBox(height: height * 0.02),
              CustomTextField(
                  hintText: "Confirm password",
                  keyboard: TextInputType.visiblePassword,
                  obscureText: true,
                  textController: confirmPasswordController),
              SizedBox(height: height * 0.1),
              SizedBox(
                height: height * 0.08,
                child: FilledButton(
                  onPressed: () {
                    final vm = context.read<DoctorRegisterViewModel>();
                    vm.registerDoctor(
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      gender: _selectedGender ?? '',
                      birthDate: ageController.text.trim(),
                      emailAddress: emailController.text.trim(),
                      phoneNumber: phoneController.text.trim(),
                      password: passwordController.text.trim(),
                      specialization: majorController.text.trim(),
                      address: addressController.text.trim(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff152238)),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
