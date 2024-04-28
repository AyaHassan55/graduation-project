import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grady/Presentation/Screens/MainPages/notification_screen.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile (
      leading:  Container(
        width: 70,
        height: 70,
        decoration:const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image:AssetImage('assets/images/profile_aya.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title:const Text('Hi Aya ..',style: TextStyle(fontFamily: 'Poppins',color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
      subtitle:const Text('How are you doing today ?',style: TextStyle(fontFamily: 'Poppins',color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
      trailing:InkWell(onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationScreen())) ,child: SvgPicture.asset('assets/images/bell.svg')),
    );
  }
}