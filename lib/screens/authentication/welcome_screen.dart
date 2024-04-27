import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grady/screens/authentication/login_screen.dart';
import 'package:grady/screens/authentication/sign_up_screen.dart';

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
                SizedBox(width: double.infinity,height: 50,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen(),));
                    },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))), child:const Text('Login',style: TextStyle(color: Colors.white),),)),
                const SizedBox(height: 20,),
                SizedBox(width: double.infinity,height: 45,child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen(),));
                },style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.white,side: const BorderSide(width: 1.0,color: Colors.black,strokeAlign: BorderSide.strokeAlignOutside,style: BorderStyle.solid),shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))), child:const Text('Register',style: TextStyle(color: Colors.black),),)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}