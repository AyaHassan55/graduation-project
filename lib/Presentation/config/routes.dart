import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grady/Presentation/Screens/Authentication/forget_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/login_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/reset_password_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/sign_up_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/subject_name_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/to_login_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/verification_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/welcome_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/about_us_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/courses_Screen.dart';
import 'package:grady/Presentation/Screens/MainPages/edit_profile_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/home_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/leaderboard_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/notification_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/profile_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/report_screen.dart';
import 'package:grady/Presentation/Screens/on_boarding/boarding_screen.dart';
import 'package:grady/Presentation/Screens/splash/splash_screen.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_cubit.dart';

import '../Screens/MainPages/camera_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/onboard',
      builder: (BuildContext context, GoRouterState state) {
        return const BoardingScreen();
      },
    ),
    GoRoute(
      path: '/welcome',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: '/signUp',
      builder: (BuildContext context, GoRouterState state) {
        return SignUpScreen();
      },
    ),
    GoRoute(
      path: '/sub',
      builder: (BuildContext context, GoRouterState state) {
        return SubjectName();
      },
    ),
    GoRoute(
      path: '/verification',
      builder: (BuildContext context, GoRouterState state) {
        return const VerificationScreen();
      },
    ), GoRoute(
      path: '/resetPassword',
      builder: (BuildContext context, GoRouterState state) {
        return const ResetScreen();
      },
    ),
    GoRoute(
      path: '/forgetPassword',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: const ForgetScreen(),
        );
      },
    ),
    GoRoute(
      path: '/doneLogin',
      builder: (BuildContext context, GoRouterState state) {
        return const ToLogin();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: const HomeScreen(),
        );
      },
    ),
    // GoRoute(
    //   path: '/notification',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const NotificationScreen();
    //   },
    // ),
    GoRoute(
      path: '/leader',
      builder: (BuildContext context, GoRouterState state) {
        return const LeaderBoardScreen();
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: const ProfileScreen(),
        );
      },
    ),
    GoRoute(
      path: '/editProfile',
      builder: (BuildContext context, GoRouterState state) {
        return const EditProfile();
      },
    ),
    GoRoute(
      path: '/courses',
      builder: (BuildContext context, GoRouterState state) {
        return const CourseScreen();
      },
    ),
    GoRoute(
      path: '/aboutUS',
      builder: (BuildContext context, GoRouterState state) {
        return const AboutUsScreen();
      },
    ),
    GoRoute(
      path: '/report',
      builder: (BuildContext context, GoRouterState state) {
        return const ReportScreen();
      },
    ),
    GoRoute(
      path: '/camera',
      builder: (BuildContext context, GoRouterState state) {
        return  CameraScreen();
      },
    ),


  ],
);
