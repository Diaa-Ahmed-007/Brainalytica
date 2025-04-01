import 'package:doctors/core/reusable_componants/custom_text_field.dart';
import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/core/utils/dialogs.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:doctors/layouts/Flows/widgets/Custom_button.dart';
import 'package:doctors/layouts/login/view_model/patient_login_view_model.dart';
import 'package:doctors/layouts/login/view_model/patient_login_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocListener<PatientLoginViewModel, PatientLoginViewModelState>(
      listenWhen: (previous, current) =>
          current is PatientLoginViewModelSuccessState ||
          current is PatientLoginViewModelErrorState ||
          current is PatientLoginViewModelLoadingState,
      listener: (context, state) {
        if (state is PatientLoginViewModelLoadingState) {
          CustomDialogs.showLoadingDialog(context);
        } else {
          CustomDialogs.closeDialogs(context);
          if (state is PatientLoginViewModelSuccessState) {
            CustomDialogs.showSuccessDialog(
              context,
              "Login Successfully!",
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.homeScreenRouteName,
                  (route) => false,
                );
              },
            );
          } else if (state is PatientLoginViewModelErrorState) {
            CustomDialogs.showErrorDialog(context, state.errorMessage);
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              Assets.assetsImagesLoginBackground,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(top: height * 0.03),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFiled(
                      hintText: 'Email',
                      keyboard: TextInputType.emailAddress,
                      textController: emailController,
                      validator: (value) =>
                          value!.isEmpty || !value.contains("@")
                              ? "Invalid email"
                              : null,
                    ),
                    SizedBox(height: height * 0.03),
                    CustomTextFiled(
                      hintText: 'Password',
                      keyboard: TextInputType.visiblePassword,
                      textController: passwordController,
                      validator: (value) => value!.length < 6
                          ? "Password must be at least 6 characters"
                          : null,
                    ),
                    SizedBox(
                      height: height * 0.12,
                    ),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.6,
                      child: CustomButton(
                        title: "Log In",
                        ontap: () {
                          if (formKey.currentState!.validate()) {
                            PatientLoginViewModel loginViewModel =
                                PatientLoginViewModel.get(context);
                            loginViewModel.patientLogin(
                              emailAddress: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
