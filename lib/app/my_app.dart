
import 'package:flutter/material.dart';
import '../Presentation/config/routes.dart';

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
