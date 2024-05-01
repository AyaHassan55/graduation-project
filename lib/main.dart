
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/Widgets/check_state_changes.dart';
import 'package:grady/core/database/cache/chash_helper.dart';
import 'package:grady/core/services/service_locator.dart';
import 'package:grady/firebase_options.dart';
import 'app/my_app.dart';
void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  checkStateChanges();


  runApp(const MyApp());
}

