
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grady/Presentation/Widgets/custom_sign_up_form.dart';
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
                const Text("Lets 's Get Started",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 36),),
                const SizedBox(height: 15,),
                const Text("Create an account to get all features",style: TextStyle(color: Colors.grey),),
                const SizedBox(height: 42,),
                const CustomSignUpForm(),
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




