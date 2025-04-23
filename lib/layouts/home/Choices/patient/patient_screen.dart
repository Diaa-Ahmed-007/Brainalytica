import 'package:doctors/core/reusable_componants/custom_text_field.dart';
import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:flutter/material.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController ageController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController pharmaceuticalController = TextEditingController();
    TextEditingController chronicDiseasesController = TextEditingController();
    return Scaffold(
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
            padding: EdgeInsets.only(top: height * 0.04, left: width * 0.03),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Patients",
                  style: TextStyle(
                      color: Color(0xffb8cfe1),
                      fontSize: 50,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                CustomTextField(
                  hintText: 'Age',
                  keyboard: TextInputType.number,
                  textController: ageController,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomTextField(
                  hintText: 'weight',
                  keyboard: TextInputType.number,
                  textController: weightController,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomTextField(
                  hintText: 'Pharmaceutical',
                  keyboard: TextInputType.name,
                  textController: pharmaceuticalController,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomTextField(
                  hintText: 'chronic diseases',
                  keyboard: TextInputType.name,
                  textController: chronicDiseasesController,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.xrayScreenRouteName);
                  },
                  child: Container(
                    height: height * 0.1,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(Icons.check,
                          color: Theme.of(context).colorScheme.primary,
                          size: 50),
                    ),
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
