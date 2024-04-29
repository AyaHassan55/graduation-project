// import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/Screens/MainPages/edit_profile_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/home_screen.dart';
import 'package:grady/Presentation/Screens/authentication/welcome_screen.dart';
 import 'package:grady/Presentation/Screens/Authentication/login_screen.dart';
import 'package:grady/Presentation/config/routes.dart';
import 'package:grady/firebase_options.dart';

// import 'Presentation/Screens/MainPages/camera_screen.dart';

// List<CameraDescription>cameras=[];
// Future <void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras=await availableCameras();
//   runApp(const MyApp());
// }
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser==null?const LoginScreen(): const HomeScreen(),
      // onGenerateRoute: appRouter.generateRoute,
    );
}
