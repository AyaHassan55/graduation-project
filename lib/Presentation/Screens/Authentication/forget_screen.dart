
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/Screens/Authentication/sign_up_screen.dart';
import 'package:grady/Presentation/Widgets/custom_forget_password_form.dart';
import 'package:grady/Presentation/utilies/consts.dart';
import 'package:grady/Presentation/utilies/custom_button.dart';
class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});
  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}
class _ForgetScreenState extends State<ForgetScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // leading:const IconButton(color: Colors.black, onPressed: () { Navigator.pop();}, icon: Icon(Icons.arrow_back_ios,)),
        ),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Forget Password ?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 33),),
                  const SizedBox(height: 20,),
                  const Text("Don't worry.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  const Text("Enter Your email and we'll send you a \nverification code to reset your password. ",),
                  const SizedBox(height: 30,),
                  const CustomForgetPasswordForm(),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

