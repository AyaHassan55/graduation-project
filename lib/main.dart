 import 'package:camera/camera.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/config/routes.dart';
import 'package:grady/core/database/cache/chash_helper.dart';
import 'package:grady/core/services/service_locator.dart';
import 'package:grady/firebase_options.dart';

// import 'Presentation/Screens/MainPages/camera_screen.dart';
 List<CameraDescription>cameras=[];
// Future <void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras=await availableCameras();
//   runApp(const MyApp());
// }
void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>MaterialApp.router(
      debugShowCheckedModeBanner: false,
       routerConfig: router,
       // home: WelcomeScreen(),
       // home: FirebaseAuth.instance.currentUser==null?const LoginScreen(): const HomeScreen(),

    );
}
