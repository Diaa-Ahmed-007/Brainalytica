import 'package:doctors/di/di.dart';
import 'package:doctors/layouts/Flows/Patients/patient_register.dart';
import 'package:doctors/layouts/Flows/Patients/provider/Patient_register_provider.dart';
import 'package:doctors/layouts/Flows/Patients/view_model/sign_up_view_model.dart';
import 'package:doctors/layouts/Flows/doctors/doctor_register.dart';
import 'package:doctors/layouts/Flows/doctors/view_model/doctor_register_view_model.dart';
import 'package:doctors/layouts/Flows/screens/flow_choose_screen.dart';
import 'package:doctors/layouts/home/Choices/Doctors/doctors_screen.dart';
import 'package:doctors/layouts/home/Choices/Doctors/view_model/all_doctors_view_model.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/all_emergancy_screen.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/emergancy_screen.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/view_model/add_emergancy_view_model.dart';
import 'package:doctors/layouts/home/Choices/Emergancy/view_model/all_emergancy_view_model.dart';
import 'package:doctors/layouts/home/Choices/Exercises/choises/hands_exercises_screen.dart';
import 'package:doctors/layouts/home/Choices/Exercises/choises/leg_exercises_screen.dart';
import 'package:doctors/layouts/home/Choices/Exercises/choises/lower_limb_exercises_screen.dart';
import 'package:doctors/layouts/home/Choices/Exercises/choises/pronunciation_and_speech_exercises_screen.dart';
import 'package:doctors/layouts/home/Choices/Exercises/execieses_screen.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/view_model/xray_view_model.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/xRay_screen.dart';
import 'package:doctors/layouts/home/Choices/add_data/init_patient_data_screen.dart';
import 'package:doctors/layouts/home/Choices/add_data/provider/save_xray_results_provider.dart';
import 'package:doctors/layouts/home/Choices/add_data/provider/upload_provider.dart';
import 'package:doctors/layouts/home/Choices/add_data/view_model/add_patient_data_view_model.dart';
import 'package:doctors/layouts/home/Choices/patient/all_patient_screen.dart';
import 'package:doctors/layouts/home/Choices/patient/view_model/all_patient_view_model.dart';
import 'package:doctors/layouts/home/chat_bot/chat_bot_view.dart';
import 'package:doctors/layouts/home/chat_bot/view_model/chat_bot_view_model.dart';
import 'package:doctors/layouts/home/screens/home_screen.dart';
import 'package:doctors/layouts/login/screens/login_screen.dart';
import 'package:doctors/layouts/login/view_model/doctor_login_view_model.dart';
import 'package:doctors/layouts/login/view_model/patient_login_view_model.dart';
import 'package:doctors/layouts/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    splashRouteName: (context) => const SplashScreen(),
    flowscreenRouteName: (context) => const FlowChooseScreen(),
    loginScreenRouteName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<PatientLoginViewModel>(
              create: (context) => getIt<PatientLoginViewModel>(),
            ),
            BlocProvider<DoctorLoginViewModel>(
              create: (context) => getIt<DoctorLoginViewModel>(),
            ),
          ],
          child: const LoginScreen(),
        ),
    patientRegisterRouteName: (context) => BlocProvider(
          create: (context) => getIt<PatientRegisterViewModel>(),
          child: ChangeNotifierProvider(
              create: (context) => PatientRegisterProvider(),
              child: const PatientRegister()),
        ),
    doctorRegisterRouteName: (context) => BlocProvider(
          create: (context) => getIt<DoctorRegisterViewModel>(),
          child: const DoctorRegister(),
        ),
    homeScreenRouteName: (context) => const HomeScreen(),
    exercisesScreenRouteName: (context) => const ExeciesesScreen(),
    initPatientDateScreenRouteName: (context) => BlocProvider(
          create: (context) => getIt<AddPatientDataViewModel>(),
          child: const InitPatientDateScreen(),
        ),
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
    doctorScreenRouteName: (context) => BlocProvider(
          create: (context) => getIt<AllDoctorsViewModel>()..getAllDoctors(),
          child: const DoctorsScreen(),
        ),
    patientScreenRouteName: (context) => BlocProvider(
          create: (context) => getIt<AllPatientsViewModel>()..getAllPatients(),
          child: const AllPatientScreen(),
        ),
    emergeancyScreenRouteName: (context) => BlocProvider(
          create: (context) => getIt<AddEmergancyViewModel>(),
          child: const EmergancyScreen(),
        ),
    handsExercisesScreenRouteName: (context) => const HandsExercisesScreen(),
    lowerLimbExercisesScreenRouteName: (context) =>
        const LowerLimbExercisesScreen(),
    pronunciationAndSpeechExercisesScreenRouteName: (context) =>
        const PronunciationAndSpeechExercisesScreen(),
    legExercisesScreenRouteName: (context) => const LegExercisesScreen(),
    chatBotViewRouteName: (_) => BlocProvider(
          create: (context) => getIt<ChatBotViewModel>(),
          child: const ChatBotView(),
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
  static const String initPatientDateScreenRouteName = "enterPatientDateScreen";
  static const String patientsScreenRouteName = "patientsScreen";
  static const String xrayScreenRouteName = "XrayScreen";
  static const String doctorScreenRouteName = "DoctorScreen";
  static const String patientScreenRouteName = "PatientScreen";
  static const String emergeancyScreenRouteName = "EmergencyScreen";
  static const String chatBotViewRouteName = "ChatBotViewScreen";
  static const String handsExercisesScreenRouteName = "HandsExercisesScreen";
  static const String lowerLimbExercisesScreenRouteName =
      "LowerLimbExercisesScreen";
  static const String pronunciationAndSpeechExercisesScreenRouteName =
      "PronunciationAndSpeechExercisesScreen";
  static const String legExercisesScreenRouteName = "LegExercisesScreen";
}
