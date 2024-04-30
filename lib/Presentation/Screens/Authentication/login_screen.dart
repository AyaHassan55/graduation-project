
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/utilies/consts.dart';
import 'package:grady/Presentation/config/routes.dart'  ;
import 'package:go_router/go_router.dart';

import 'package:grady/Presentation/utilies/custom_button.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
                const Text('Hello Again!', style: TextStyle(
                    color: CupertinoColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),),
                const SizedBox(height: 15,),
                const Text("Welcome back You 've\n        been missed! ",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 42,),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  cursorColor: CupertinoColors.black,
                  cursorRadius: const Radius.circular(2),
                  decoration: InputDecoration(

                    enabledBorder: myInputBorder(),
                    focusedBorder: myInputBorder(),
                    labelText: 'Enter Email',
                    labelStyle: const TextStyle(color: CupertinoColors.black),
                    prefixIcon: const Icon(
                      Icons.email_outlined, color: CupertinoColors.black,),
                  ),
                ),
                const SizedBox(height: 22,),
                TextFormField(
                  obscureText: !isVisible,
                  obscuringCharacter: '*',
                  textAlign: TextAlign.start,
                  cursorColor: CupertinoColors.black,
                  cursorRadius: const Radius.circular(2),
                  decoration: InputDecoration(
                    enabledBorder: myInputBorder(),
                    focusedBorder: myInputBorder(),
                    labelText: 'Enter Password',
                    labelStyle: const TextStyle(color: CupertinoColors.black),
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      color: CupertinoColors.black,
                    ),
                    suffixIcon: isVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
                TextButton(onPressed: ()=> GoRouter.of(context).push('/forgetPassword'),

                    child: const Align(alignment: Alignment.bottomRight, child: Text('Forget Password ?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),))),
                const SizedBox(height: 80,),
                const CustomElevatedButton(text: 'Login', pageName: '/home',),

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

