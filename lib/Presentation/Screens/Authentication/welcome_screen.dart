import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:grady/Presentation/config/routes.dart' ;
import 'package:grady/Presentation/utilies/custom_button.dart';
import 'package:grady/core/database/cache/chach_helper.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 43,right: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                const Text('Please login or sign up to continue\nusing our app.'),
                const SizedBox(height: 48,),
                Center(child: SvgPicture.asset('assets/images/welcome.svg')),
                const SizedBox(height: 20,),
                const CustomElevatedButton(text: 'Login', pageName: '/login',),
                const SizedBox(height: 20,),
                SizedBox(width: double.infinity,height: 45,
                  child: ElevatedButton(
                    onPressed: (){
                      GoRouter.of(context).push('/signUp');

                      },
                      style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,
                      backgroundColor: Colors.white,
                      side: const BorderSide(width: 1.0,color: Colors.black,strokeAlign: BorderSide.strokeAlignOutside,style: BorderStyle.solid),
                      shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
                      child:const Text('Sign Up',style: TextStyle(color:
                     Colors.black),),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

