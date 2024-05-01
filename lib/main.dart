 import 'package:camera/camera.dart';
 import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/Widgets/check_state_changes.dart';
import 'package:grady/Presentation/config/routes.dart';
import 'package:grady/core/database/cache/chash_helper.dart';
import 'package:grady/core/services/service_locator.dart';
import 'package:grady/firebase_options.dart';

import 'app/my_app.dart';

// import 'Presentation/Screens/MainPages/camera_screen.dart';
 List<CameraDescription>cameras=[];
// Future <void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras=await availableCameras();
//   runApp(const MyApp());
// }
void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  checkStateChanges();

  runApp(const MyApp());
}

