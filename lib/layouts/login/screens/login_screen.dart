import 'package:doctors/core/reusable_componants/custom_text_field.dart';
import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/layouts/Flows/widgets/Custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passworsController = TextEditingController();
    return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFiled(
                  hintText: 'Email',
                  keyboard: TextInputType.emailAddress,
                  textController: emailController,
                ),
                SizedBox(height: height * 0.03),
                CustomTextFiled(
                  hintText: 'Passwors',
                  keyboard: TextInputType.visiblePassword,
                  textController: passworsController,
                ),
                SizedBox(
                  height: height * 0.12,
                ),
                SizedBox(
                  height: height * 0.07,
                  width: width * 0.6,
                  child: CustomButton(
                    title: "Log In",
                    ontap: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
