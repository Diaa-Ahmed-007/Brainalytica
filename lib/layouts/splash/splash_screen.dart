import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/core/utils/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    _navigatetohome();
  }
    _navigatetohome() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        // checkAutoLogin();
         Navigator.of(context).pushReplacementNamed(Routes.flowscreenRouteName);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.assetsImagesSplash,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}