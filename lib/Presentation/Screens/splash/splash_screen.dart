import 'dart:async';
import 'package:grady/Presentation/Screens/on_boarding/boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/config/routes.dart';
import 'package:go_router/go_router.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds:10),
            (){
          GoRouter.of(context).push('/onboard');
        }
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
