import 'package:doctors/config/themes.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRouteName,
      routes: Routes.routes,
      theme: Themes.themeData,
    );
  }
}
