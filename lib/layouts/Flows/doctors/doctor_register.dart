import 'package:doctors/core/reusable_componants/custom_text_field.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:flutter/material.dart';

class DoctorRegister extends StatefulWidget {
  const DoctorRegister({super.key});

  @override
  State<DoctorRegister> createState() => _DoctorRegisterState();
}

class _DoctorRegisterState extends State<DoctorRegister> {
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
    TextEditingController majorController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
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
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      hintText: "First Name",
                      keyboard: TextInputType.name,
                      textController: firstNameController),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CustomTextField(
                      hintText: "last Name",
                      keyboard: TextInputType.name,
                      textController: lastNameController),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
                hintText: "yyyy-mm-dd",
                keyboard: TextInputType.number,
                textController: ageController),
            SizedBox(
              height: height * 0.02,
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
                  child: CustomTextField(
                      hintText: "phone number",
                      keyboard: TextInputType.number,
                      textController: phoneController),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      hintText: "Major",
                      keyboard: TextInputType.name,
                      textController: majorController),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CustomTextField(
                      hintText: "Address",
                      keyboard: TextInputType.name,
                      textController: addressController),
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
                hintText: "email",
                keyboard: TextInputType.emailAddress,
                textController: emailController),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
                hintText: "password",
                keyboard: TextInputType.visiblePassword,
                obscureText: true,
                textController: passwordController),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
                hintText: "confirm password",
                keyboard: TextInputType.visiblePassword,
                obscureText: true,
                textController: confirmPasswordController),
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
              height: height * 0.08,
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
    );
  }
}
