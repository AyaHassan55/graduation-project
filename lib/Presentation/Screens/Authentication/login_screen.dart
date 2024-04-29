
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/Screens/Authentication/forget_screen.dart';
import 'package:grady/Presentation/Screens/Authentication/sign_up_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/home_screen.dart';
import 'package:grady/Presentation/utilies/consts.dart';
import 'package:grady/Presentation/config/routes.dart' as route;

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
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => const ForgetScreen()));
                },
                    child: const Align(alignment: Alignment.bottomRight,
                        child: Text('Forget Password ?',
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.black),))),

                // const Align(alignment: Alignment.bottomRight,child:  TextButton(onPressed(){},child: )),
                const SizedBox(height: 80,),
                SizedBox(width: double.infinity,
                    height: 50,
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                      style: ElevatedButton.styleFrom(shadowColor: Colors.grey,
                          elevation: 5,
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12)))),
                      child: const Text('Login', style: TextStyle(color: Colors
                          .white),),)),
                const SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Create A New Account ?', style: TextStyle(color: Colors.grey)),
                  TextButton(onPressed: ()=> Navigator.pushNamed(context, route.Routes.signUp),
                      child: const Text('Sign up', style: TextStyle(color: CupertinoColors.black, decoration: TextDecoration.underline))),
                ],),

              ],
            ),
          ),
        ),
      ),
    ));
  }
}

