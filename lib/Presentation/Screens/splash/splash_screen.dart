import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/database/cache/chash_helper.dart';
import '../../../core/services/service_locator.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  late Timer _timer;
  late int time;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds:290), (timer) {
      setState(() {
        if (_currentIndex < 9) {
          _currentIndex++;
        } else {
          _timer.cancel();
          bool isOnBoardingVisited = getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
          if(isOnBoardingVisited == true){
            FirebaseAuth.instance.currentUser==null? delayedNavigate(context, "/login"):delayedNavigate(context,'/home');
          }else{
            delayedNavigate(context, "/onboard");
          }

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SvgPicture.asset('assets/images/Splash Screen$_currentIndex.svg'),
      ),
    );
  }
}



void delayedNavigate(context, path) =>GoRouter.of(context).push(path);

