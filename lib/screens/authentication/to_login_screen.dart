import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(top: 98.0),
                    child: SizedBox(width: double.infinity,height: 50,child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))), child:const Text('Login',style: TextStyle(color: Colors.white),),)),
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
