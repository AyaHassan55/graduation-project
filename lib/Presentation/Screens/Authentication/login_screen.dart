
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/Widgets/custom_sign_in_form.dart';
import 'package:grady/Presentation/utilies/consts.dart';
import 'package:go_router/go_router.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_state.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key,});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hello Again!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 36),),
                const SizedBox(height: 15,),
                const Text("Welcome back You 've\n        been missed! ",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 42,),
                const CustomSignInForm(),
                const SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Create A New Account ?',
                      style: TextStyle(color: Colors.grey)),

                  TextButton(onPressed: ()=> context.go('/signUp'),
                      child: const Text('Sign up', style: TextStyle(
                          color: CupertinoColors.black,
                          decoration: TextDecoration.underline))),
                ],),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

