
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 120,height: 400,
        child: Container(
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),),],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text('  You wanna start recording ?',style: TextStyle(fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.bold),),
              const Spacer(flex: 1,),
              Center(child:  SvgPicture.asset('assets/images/video_recording.svg')),
              const Spacer(flex: 1,),
              const Text('  if you wanna start recording, please just press on\n  The button and start recording',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold),),
              const Spacer(flex: 1,),
              Center(
                child: ElevatedButton(onPressed: (){
                  // pickImage();
                },
                  style:const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  child: SvgPicture.asset('assets/images/camera-view.svg'),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}