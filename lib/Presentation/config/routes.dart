
import 'package:flutter/material.dart';
import 'package:grady/Presentation/Screens/Authentication/forget_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/login_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/reset_password_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/sign_up_screen.dart';
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
class Routes {
  static const String splash = '/';
  static const String onboard = 'onboard';
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String verification = 'verification';
  static const String resetPassword = 'resetPassword';
  static const String forgetPassword = 'forgetPassword';
  static const String otpCode = 'otpCode';
  static const String doneLogin = 'doneLogin';
  static const String home = 'home';
  static const String leaderBoard = 'leaderBoard';
  static const String notification = 'notification';
  static const String profile = 'profile';
  static const String editProfile = 'editProfile';
  static const String aboutUs = 'aboutUs';
  static const String course = 'course';
  static const String report = 'report';
}

  Route<dynamic>controller(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboard:
        return MaterialPageRoute(builder: (_) => const BoardingScreen());
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetScreen());
      case Routes.verification:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetScreen());
      case Routes.doneLogin:
        return MaterialPageRoute(builder: (_) => const ToLogin());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.leaderBoard:
        return MaterialPageRoute(builder: (_) => const LeaderBoardScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfile());
      case Routes.aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      case Routes.course:
        return MaterialPageRoute(builder: (_) => const CourseScreen());
      case Routes.report:
        return MaterialPageRoute(builder: (_) => const ReportScreen());
      default:
        throw('This route name dose not exist');
    }
  }

