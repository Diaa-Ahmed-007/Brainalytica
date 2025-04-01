import 'package:doctors/di/di.dart';
import 'package:doctors/layouts/Flows/Patients/patient_register.dart';
import 'package:doctors/layouts/Flows/Patients/provider/Patient_register_provider.dart';
import 'package:doctors/layouts/Flows/Patients/view_model/sign_up_view_model.dart';
import 'package:doctors/layouts/Flows/doctors/doctor_register.dart';
import 'package:doctors/layouts/Flows/screens/flow_choose_screen.dart';
import 'package:doctors/layouts/home/Choices/Awareness/awareness_screen.dart';
import 'package:doctors/layouts/home/Choices/Exercises/execieses_screen.dart';
import 'package:doctors/layouts/home/Choices/patient/Xray/view_model/xray_view_model.dart';
import 'package:doctors/layouts/home/Choices/patient/Xray/xRay_screen.dart';
import 'package:doctors/layouts/home/Choices/patient/patient_screen.dart';
import 'package:doctors/layouts/home/Choices/patient/provider/save_xray_results_provider.dart';
import 'package:doctors/layouts/home/Choices/patient/provider/upload_provider.dart';
import 'package:doctors/layouts/home/screens/home_screen.dart';
import 'package:doctors/layouts/login/screens/login_screen.dart';
import 'package:doctors/layouts/login/view_model/patient_login_view_model.dart';
import 'package:doctors/layouts/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    splashRouteName: (context) => const SplashScreen(),
    flowscreenRouteName: (context) => const FlowChooseScreen(),
    loginScreenRouteName: (context) => BlocProvider(
          create: (context) => getIt<PatientLoginViewModel>(),
          child: const LoginScreen(),
        ),
    patientRegisterRouteName: (context) => BlocProvider(
          create: (context) => getIt<PatientRegisterViewModel>(),
          child: ChangeNotifierProvider(
              create: (context) => PatientRegisterProvider(),
              child: const PatientRegister()),
        ),
    doctorRegisterRouteName: (context) => const DoctorRegister(),
    homeScreenRouteName: (context) => const HomeScreen(),
    exercisesScreenRouteName: (context) => const ExeciesesScreen(),
    awarenessScreenRouteName: (context) => const AwarenessScreen(),
    patientScreenRouteName: (context) => const PatientScreen(),
    xrayScreenRouteName: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => UploadProvider()),
            ChangeNotifierProvider(
                create: (context) => SaveXrayResultsProvider()),
          ],
          child: BlocProvider(
            create: (context) => getIt<XrayViewModel>(),
            child: XrayScreen(),
          ),
        ),
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
  static const String patientScreenRouteName = "PatientScreen";
  static const String xrayScreenRouteName = "XrayScreen";
}
