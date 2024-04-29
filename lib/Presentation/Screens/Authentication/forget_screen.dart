
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grady/Presentation/Screens/Authentication/verification_screen.dart';
import 'package:grady/Presentation/utilies/consts.dart';
import 'package:grady/Presentation/config/routes.dart' as route;
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
                  TextFormField(
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
                  const SizedBox(height: 160,),
                  SizedBox(width: double.infinity,height: 50,child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerificationScreen()));
                  },style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))), child:const Text('Continue',style: TextStyle(color: Colors.white),),)),
                  const SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Create A New Account ?',style: TextStyle(color: Colors.grey)),
                      TextButton(onPressed:(){
                        Navigator.pushNamed(context, route.Routes.signUp);
                      } ,
                          child:const Text( 'Sign up',style: TextStyle(color: CupertinoColors.black,decoration: TextDecoration.underline))),
                    ],),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

