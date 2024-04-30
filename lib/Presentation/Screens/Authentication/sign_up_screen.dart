import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/utilies/consts.dart';
import 'package:grady/Presentation/config/routes.dart' ;
import 'package:go_router/go_router.dart';

import 'package:grady/Presentation/utilies/custom_button.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

                TextFormField(
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.start,
                  cursorColor:CupertinoColors.black,
                  cursorRadius: const Radius.circular(2),
                  decoration: InputDecoration(

                    enabledBorder:myInputBorder(),
                    focusedBorder: myInputBorder(),
                    labelText: 'Enter Your Full Name',
                    labelStyle:const TextStyle(color: Colors.black),
                    prefixIcon:const Icon(Icons.person_2_outlined,color:Colors.black,),
                  ),
                ),
                const SizedBox(height: 22,),
                TextFormField(
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
                const SizedBox(height: 22,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  cursorColor:CupertinoColors.black,
                  cursorRadius: const Radius.circular(2),
                  decoration: InputDecoration(

                    enabledBorder:myInputBorder(),
                    focusedBorder: myInputBorder(),
                    labelText: 'Enter Email',
                    labelStyle:const TextStyle(color: Colors.black),
                    prefixIcon:const Icon(Icons.email_outlined,color: Colors.black,),
                  ),
                ),
                const SizedBox(height: 22,),
                TextFormField(
                  obscureText: !isVisible,
                  obscuringCharacter: '*',
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  cursorRadius: const Radius.circular(2),
                  decoration: InputDecoration(
                    enabledBorder: myInputBorder(),
                    focusedBorder: myInputBorder(),
                    labelText: 'Enter Password',
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      color: CupertinoColors.black,
                    ),
                    suffixIcon: isVisible ?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
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
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: CupertinoColors.black),
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      color: CupertinoColors.black,
                    ),
                    suffixIcon: isVisible ?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                  ),
                ),



                const SizedBox(height: 80,),
                const CustomElevatedButton(text:  'Sign Up', pageName: '/home'),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have account ?',style: TextStyle(color: Colors.grey),),
                    TextButton(onPressed: ()=> context.go('/login'),
                     child: const Text('Log in',style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),),),
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


