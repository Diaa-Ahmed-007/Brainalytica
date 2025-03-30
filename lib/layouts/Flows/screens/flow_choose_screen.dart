import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:doctors/layouts/Flows/widgets/Custom_button.dart';
import 'package:flutter/material.dart';

class FlowChooseScreen extends StatelessWidget {
  const FlowChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.assetsImagesFlowsBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                height: height * 0.07,
                width: double.infinity,
                child: CustomButton(
                  title: "Log In",
                  ontap: () {
                    Navigator.pushNamed(context, Routes.loginScreenRouteName);
                  },
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "Choose your flow",
                style: TextStyle(color: Colors.white38, fontSize: 30),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.35,
                    child: CustomButton(
                      title: "Patient",
                      ontap: () {
                        Navigator.pushNamed(
                            context, Routes.patientRegisterRouteName);
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.35,
                    child: CustomButton(
                      title: "Doctor",
                      ontap: () {
                        Navigator.pushNamed(
                            context, Routes.doctorRegisterRouteName);
                      },
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
