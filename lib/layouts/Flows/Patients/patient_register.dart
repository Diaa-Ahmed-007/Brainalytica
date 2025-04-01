import 'dart:developer';

import 'package:doctors/core/reusable_componants/custom_text_field.dart';
import 'package:doctors/core/utils/dialogs.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:doctors/layouts/Flows/Patients/provider/Patient_register_provider.dart';
import 'package:doctors/layouts/Flows/Patients/view_model/sign_up_view_model.dart';
import 'package:doctors/layouts/Flows/Patients/view_model/sign_up_view_model_state.dart';
import 'package:doctors/layouts/Flows/Patients/widgets/gender_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PatientRegister extends StatefulWidget {
  const PatientRegister({super.key});

  @override
  State<PatientRegister> createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegister> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final patientRegisterProvider =
        Provider.of<PatientRegisterProvider>(context);
    double height = 24;

    return BlocListener<PatientRegisterViewModel,
        PatientRegisterViewModelState>(
      listenWhen: (previous, current) =>
          current is PatientRegisterViewModelSuccessState ||
          current is PatientRegisterViewModelErrorState ||
          current is PatientRegisterViewModelLoadingState,
      listener: (context, state) async {
        if (state is PatientRegisterViewModelLoadingState) {
          CustomDialogs.showLoadingDialog(context);
        } else {
          CustomDialogs.closeDialogs(context);
          if (state is PatientRegisterViewModelSuccessState) {
            log(state.patientModel.message.toString());
            CustomDialogs.showSuccessDialog(
                context, "Account created successfully!");
            Future.delayed(
              const Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.flowscreenRouteName,
                (route) => false,
              ),
            );
          } else if (state is PatientRegisterViewModelErrorState) {
            CustomDialogs.showErrorDialog(context, state.errorMessage);
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                "Create new \n Account",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFiled(
                              hintText: "First Name",
                              keyboard: TextInputType.name,
                              textController: firstNameController,
                              validator: (value) => value!.isEmpty
                                  ? "This field can't be empty"
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomTextFiled(
                              hintText: "Last Name",
                              keyboard: TextInputType.name,
                              textController: lastNameController,
                              validator: (value) => value!.isEmpty
                                  ? "This field can't be empty"
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height),
                      CustomTextFiled(
                        hintText: "yyyy-mm-dd",
                        keyboard: TextInputType.number,
                        textController: ageController,
                        validator: (value) =>
                            value!.isEmpty ? "This field can't be empty" : null,
                      ),
                      SizedBox(height: height),
                      Row(
                        children: [
                          GenderChoose(),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomTextFiled(
                              hintText: "Phone Number",
                              keyboard: TextInputType.number,
                              textController: phoneController,
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "This field can't be empty";
                                if (value.length != 11)
                                  return "Phone number must be 11 digits";
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height),
                      CustomTextFiled(
                        hintText: "Email",
                        keyboard: TextInputType.emailAddress,
                        textController: emailController,
                        validator: (value) =>
                            value!.isEmpty || !value.contains("@")
                                ? "Invalid email"
                                : null,
                      ),
                      SizedBox(height: height),
                      CustomTextFiled(
                        hintText: "Password",
                        keyboard: TextInputType.visiblePassword,
                        obscureText: true,
                        textController: passwordController,
                        validator: (value) => value!.length < 6
                            ? "Password must be at least 6 characters"
                            : null,
                      ),
                      SizedBox(height: height),
                      CustomTextFiled(
                        hintText: "Confirm Password",
                        keyboard: TextInputType.visiblePassword,
                        obscureText: true,
                        textController: confirmPasswordController,
                        validator: (value) => value != passwordController.text
                            ? "Passwords do not match"
                            : null,
                      ),
                      SizedBox(height: height * 3),
                      SizedBox(
                        height: height * 2.5,
                        child: FilledButton(
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                patientRegisterProvider.selectedGender !=
                                    null) {
                              PatientRegisterViewModel.get(context).signUp(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                gender:
                                    patientRegisterProvider.selectedGender ??
                                        "male",
                                birthDate: ageController.text,
                                emailAddress: emailController.text,
                                phoneNumber: phoneController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff152238)),
                          child: const Text('Sign Up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                    ],
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
