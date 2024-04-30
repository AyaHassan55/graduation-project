import 'dart:async';

import 'package:grady/Presentation/Screens/on_boarding/boarding_screen.dart';
import 'package:grady/Presentation/config/routes.dart' as route;
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
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 10), () {
      navigateToBoardingScreen();
    });
  }

  void navigateToBoardingScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BoardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset(
        'assets/images/animate.gif',
        width: double.infinity,
      ),
    );
  }
}
