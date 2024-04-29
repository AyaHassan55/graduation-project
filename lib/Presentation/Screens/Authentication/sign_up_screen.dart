import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/Screens/MainPages/home_screen.dart';
import 'package:grady/Presentation/utilies/consts.dart';

import 'login_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullName=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Lets 's Get Started",style: TextStyle(color: CupertinoColors.black,fontWeight: FontWeight.bold,fontSize: 36),),
                const SizedBox(height: 15,),
                const Text("Create an account to get all features",style: TextStyle(color: Colors.grey),),
                const SizedBox(height: 42,),

                Material(
                  elevation: 4.0,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    controller: fullName,
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.start,
                    cursorColor:CupertinoColors.black,
                    cursorRadius: const Radius.circular(2),
                    decoration: InputDecoration(

                      enabledBorder:myInputBorder(),
                      focusedBorder: myInputBorder(),
                      labelText: 'Enter Your Full Name',
                      labelStyle:const TextStyle(color: CupertinoColors.black),
                      prefixIcon:const Icon(Icons.person_2_outlined,color: CupertinoColors.black,),
                    ),
                  ),
                ),
                const SizedBox(height: 22,),

                Material(
                  elevation: 4.0,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.start,
                    cursorColor:CupertinoColors.black,
                    cursorRadius: const Radius.circular(2),
                    decoration: InputDecoration(


                      enabledBorder:myInputBorder(),
                      focusedBorder: myInputBorder(),
                      labelText: 'Enter Phone Number',
                      labelStyle:const TextStyle(color: CupertinoColors.black),
                      prefixIcon:const Icon(Icons.local_phone_rounded,color: CupertinoColors.black,),
                    ),
                  ),
                ),
                const SizedBox(height: 22,),

                Material(
                  elevation: 4.0,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    cursorColor:CupertinoColors.black,
                    cursorRadius: const Radius.circular(2),
                    decoration: InputDecoration(

                      enabledBorder:myInputBorder(),
                      focusedBorder: myInputBorder(),
                      labelText: 'Enter Email',
                      labelStyle:const TextStyle(color: CupertinoColors.black),
                      prefixIcon:const Icon(Icons.email_outlined,color: CupertinoColors.black,),
                    ),
                  ),
                ),
                const SizedBox(height: 22,),

                Material(
                  elevation: 4.0,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    controller: password,
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
                      suffixIcon: isVisible ?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(height: 22,),

                Material(
                  elevation: 4.0,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    obscureText: !isVisible,
                    obscuringCharacter: '*',
                    textAlign: TextAlign.start,
                    cursorColor: CupertinoColors.black,
                    cursorRadius: const Radius.circular(2),
                    decoration: InputDecoration(
                      enabledBorder: myInputBorder(),
                      focusedBorder: myInputBorder(),
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(color: CupertinoColors.black),
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: CupertinoColors.black,
                      ),
                      suffixIcon: isVisible ?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    ),
                  ),
                ),



                const SizedBox(height: 80,),
                SizedBox(width: double.infinity,height: 50,child: ElevatedButton(
                  onPressed: () async{
                    try {
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (_) => const HomeScreen(),),);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        log('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        log('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }

                },
                  style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
                  child:const Text('Sign up',style: TextStyle(color: Colors.white),),)),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have account ?',style: TextStyle(color: Colors.grey),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                    }, child: const Text('Log in',style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),),),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    ));
  }

}


