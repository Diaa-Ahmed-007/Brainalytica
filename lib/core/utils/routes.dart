import 'package:doctors/layouts/Flows/Patients/patient_register.dart';
import 'package:doctors/layouts/Flows/doctors/doctor_register.dart';
import 'package:doctors/layouts/Flows/screens/flow_choose_screen.dart';
import 'package:doctors/layouts/home/Choices/Awareness/awareness_screen.dart';
import 'package:doctors/layouts/home/Choices/Exercises/execieses_screen.dart';
import 'package:doctors/layouts/home/screens/home_screen.dart';
import 'package:doctors/layouts/login/screens/login_screen.dart';
import 'package:doctors/layouts/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    splashRouteName: (context) => const SplashScreen(),
    flowscreenRouteName: (context) => const FlowChooseScreen(),
    loginScreenRouteName: (context) => const LoginScreen(),
    patientRegisterRouteName: (context) => const PatientRegister(),
    doctorRegisterRouteName: (context) => const DoctorRegister(),
    homeScreenRouteName: (context) => const HomeScreen(),
    exercisesScreenRouteName: (context) => const ExeciesesScreen(),
    awarenessScreenRouteName: (context) => const AwarenessScreen(),
  };
//------------------------------------------------------------------
  static const String splashRouteName = "splashScreen";
  static const String flowscreenRouteName = "flowscreen";
  static const String loginScreenRouteName = "LoginScreen";
  static const String patientRegisterRouteName = "PatientRegister";
  static const String doctorRegisterRouteName = "DoctorRegister";
  static const String homeScreenRouteName = "HomeScreen";
  static const String exercisesScreenRouteName = "ExercisesScreen";
  static const String awarenessScreenRouteName = "AwarenessScreen";
}
