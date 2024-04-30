import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:grady/Presentation/utilies/custom_button.dart';
class ToLogin extends StatefulWidget {
  const ToLogin({super.key});

  @override
  State<ToLogin> createState() => _ToLoginState();
}

class _ToLoginState extends State<ToLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/undraw_completing.svg'),
                  const SizedBox(height: 40,),
                  const Text('Your password has been updated ',style: TextStyle(fontFamily: 'Poppins',color: Colors.black,fontWeight: FontWeight.bold)),
                  const Text('successfully',style: TextStyle(fontFamily: 'Poppins',color: Colors.black,fontWeight: FontWeight.bold),),
                  const Padding(
                    padding:  EdgeInsets.only(top: 98.0),
                    child: CustomElevatedButton(text: 'Login',pageName:'/login'),

                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
