import 'package:doctors/my_app.dart';
import 'package:flutter/material.dart';

import 'di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
