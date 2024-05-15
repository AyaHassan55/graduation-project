import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import '../Presentation/config/routes.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
      BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          // home: WelcomeScreen(),
          // home: FirebaseAuth.instance.currentUser==null?const LoginScreen(): const HomeScreen(),

        ),
      );
}
