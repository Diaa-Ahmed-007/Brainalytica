import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }
    _navigatetohome() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        // checkAutoLogin();
        // Navigator.of(context).pushReplacementNamed(Routes.loginRouteName);
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
            'assets/images/splash.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}