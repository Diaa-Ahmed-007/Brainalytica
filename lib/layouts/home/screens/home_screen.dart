import 'package:doctors/core/utils/routes.dart';
import 'package:doctors/layouts/home/widgets/custom_home_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        toolbarHeight: height * 0.2,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        title: Text(
          "welcme To \nBrainalytica",
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
            title: "DOCTORS",
            ontap: () {},
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomHomeButton(
            title: "AWARENESS",
            ontap: () {
              Navigator.pushNamed(context, Routes.awarenessScreenRouteName);
            },
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomHomeButton(
            title: "EXERCISES",
            ontap: () {
              Navigator.pushNamed(context, Routes.exercisesScreenRouteName);
            },
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomHomeButton(
            title: "ILLNESSES",
            ontap: () {},
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomHomeButton(
            title: "patient",
            ontap: () {},
          )
        ],
      ),
    );
  }
}
