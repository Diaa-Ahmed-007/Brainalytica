import 'package:doctors/core/utils/routes.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_home_button.dart';

class ExeciesesScreen extends StatelessWidget {
  const ExeciesesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        toolbarHeight: height * 0.2,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        title: Text(
          "Exercises",
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          CustomHomeButton(
            title: "Hands",
            ontap: () {
              Navigator.pushNamed(
                  context, Routes.handsExercisesScreenRouteName);
            },
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomHomeButton(
            title: "lower Limb Exercises",
            ontap: () {
              Navigator.pushNamed(
                  context, Routes.lowerLimbExercisesScreenRouteName);
            },
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomHomeButton(
            title: "pronunciation And Speech Exercises",
            ontap: () {
              Navigator.pushNamed(context,
                  Routes.pronunciationAndSpeechExercisesScreenRouteName);
            },
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomHomeButton(
            title: "leg Exercises",
            ontap: () {
              Navigator.pushNamed(context, Routes.legExercisesScreenRouteName);
            },
          ),
        ],
      ),
    );
  }
}
