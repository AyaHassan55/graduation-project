import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: const  BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            border: Border(
              top:  BorderSide(
                color: Colors.white,
                width: 2.5,
              ),
              // bottom: BorderSide(
              //   color: Colors.white.withOpacity(0.5),
              //   width: 2,
              // ),

            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const Padding(
                 padding:  EdgeInsets.only(bottom: 18.0),
                 child:  ImageIcon(AssetImage('assets/icons/Logo_Icon.png'), size: 300,),
               ),
              const SizedBox(height:6,), Positioned(bottom: 10, child: SvgPicture.asset('assets/icons/logo_name.svg', width: 220,),),

            ],
          ),
        ),
      ),
    );

  }
}
