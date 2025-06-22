import 'dart:developer';

import 'package:doctors/core/utils/routes.dart';
import 'package:doctors/data/models/doctor_register_model/doctor_login_model.dart';
import 'package:doctors/data/models/patient_login_model/patient_login_model.dart';
import 'package:doctors/di/di.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/all_emergancy_screen.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/view_model/all_emergancy_view_model.dart';
import 'package:doctors/layouts/home/widgets/custom_home_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)?.settings.arguments;

    PatientLoginModel? patient;
    DoctorLoginModel? doctor;

    if (args is PatientLoginModel) {
      patient = args;
      log("patient: ${patient.token}");
      log("patient id: ${patient.user?.patientId}");
    } else if (args is DoctorLoginModel) {
      doctor = args;
      log("doctor: ${doctor.token}");
    }

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
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: height * 0.07),
          Visibility(
            visible: doctor == null,
            child: CustomHomeButton(
              title: "DOCTORS",
              ontap: () {
                Navigator.pushNamed(context, Routes.doctorScreenRouteName);
              },
            ),
          ),
          SizedBox(height: height * 0.04),
          CustomHomeButton(
            title: "EXERCISES",
            ontap: () {
              Navigator.pushNamed(context, Routes.exercisesScreenRouteName);
            },
          ),
          Visibility(
              visible: patient == null, child: SizedBox(height: height * 0.04)),
          Visibility(
            visible: patient == null,
            child: CustomHomeButton(
              title: "Patients",
              ontap: () {
                Navigator.pushNamed(context, Routes.patientScreenRouteName);
              },
            ),
          ),
          SizedBox(height: height * 0.04),
          patient == null
              ? CustomHomeButton(
                  title: "All Emergencies",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => getIt<AllEmergancyViewModel>()
                              ..loadEmergencies(),
                            child: const AllEmergencyScreen(),
                          ),
                        ));
                  })
              : CustomHomeButton(
                  title: "Emergancy",
                  ontap: () {
                    Navigator.pushNamed(
                        context, Routes.emergeancyScreenRouteName,
                        arguments: patient);
                  },
                ),
          Visibility(
              visible: doctor == null, child: SizedBox(height: height * 0.04)),
          Visibility(
            visible: doctor == null,
            child: CustomHomeButton(
              title: "add my data",
              ontap: () {
                Navigator.pushNamed(
                    context, Routes.initPatientDateScreenRouteName,
                    arguments: patient);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String token = patient?.token ?? doctor?.token ?? '';
          Navigator.pushNamed(
            context,
            Routes.chatBotViewRouteName,
            arguments: token,
          );
        },
        shape: const CircleBorder(),
        child: Icon(
          Icons.chat,
        ),
      ),
    );
  }
}
