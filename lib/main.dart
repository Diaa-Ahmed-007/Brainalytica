import 'package:doctors/core/api/api_manger.dart';
import 'package:doctors/core/cubit/bloc_observer.dart';
import 'package:doctors/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/di.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  ApiManger.initAiModel();
  ApiManger.initBackEnd();
  runApp(const MyApp());
}
