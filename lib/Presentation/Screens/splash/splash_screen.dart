import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grady/core/database/cache/chash_helper.dart';
import 'package:grady/core/services/service_locator.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    bool isOnBoardingVisited = getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
    if(isOnBoardingVisited == true){
      delayedNavigate(context, "/login");
    }else{
      delayedNavigate(context, "/onboard");
    }

  }

  void navigateToBoardingScreen() {

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
void delayedNavigate(context, path) {
  Future.delayed(
    const Duration(seconds: 2),
        () {
      GoRouter.of(context).push(path);

    },
  );
}