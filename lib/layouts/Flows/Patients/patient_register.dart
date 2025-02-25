import 'package:doctors/core/reusable_componants/custom_text_field.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:flutter/material.dart';

class PatientRegister extends StatefulWidget {
  const PatientRegister({super.key});

  @override
  State<PatientRegister> createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegister> {
  String? _selectedGender;

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

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    double height = 24;
    return Scaffold(
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
      ),
      body: Column(
        children: [
          Text(
            "Create new \n Account",
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 40,
                fontWeight: FontWeight.w600),
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
                            textController: firstNameController),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomTextFiled(
                            hintText: "last Name",
                            keyboard: TextInputType.name,
                            textController: lastNameController),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height,
                  ),
                  CustomTextFiled(
                      hintText: "Age",
                      keyboard: TextInputType.number,
                      textController: ageController),
                  SizedBox(
                    height: height,
                  ),
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
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomTextFiled(
                            hintText: "phone number",
                            keyboard: TextInputType.number,
                            textController: phoneController),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height,
                  ),
                  CustomTextFiled(
                      hintText: "email",
                      keyboard: TextInputType.emailAddress,
                      textController: emailController),
                  SizedBox(
                    height: height,
                  ),
                  CustomTextFiled(
                      hintText: "password",
                      keyboard: TextInputType.visiblePassword,
                      obscureText: true,
                      textController: passwordController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                      hintText: "confirm password",
                      keyboard: TextInputType.visiblePassword,
                      obscureText: true,
                      textController: confirmPasswordController),
                  SizedBox(
                    height: height * 3,
                  ),
                  SizedBox(
                    height: height * 2.5,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.homeScreenRouteName,
                          (route) {
                            return false;
                          },
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
