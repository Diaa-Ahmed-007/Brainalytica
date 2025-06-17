import 'package:doctors/config/themes.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:doctors/layouts/home/Choices/add_data/provider/analysis_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnalysisDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRouteName,
        routes: Routes.routes,
        theme: Themes.themeData,
      ),
    );
  }
}
