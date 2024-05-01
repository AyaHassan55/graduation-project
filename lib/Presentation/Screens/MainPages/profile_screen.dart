import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grady/Presentation/Screens/MainPages/about_us_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/edit_profile_screen.dart';

import '../../config/routes.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  bool state=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
        centerTitle: true,
        leading:InkWell(onTap: (){router.pop();router.go('/home');},child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading:
              Container(width: 90, height: 150, decoration:const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image:AssetImage('assets/images/girll.png'), ),)),
              title:const Text('Aya Hassan',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
              subtitle:const Text('Flutter Developer',style: TextStyle(fontFamily: 'Poppins',fontSize: 16)),
              trailing:InkWell(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditProfile()))
                  ,child: SvgPicture.asset('assets/images/edit.svg')),
            ),
            const SizedBox(height: 56,),
            buildCardProfileScreen(SvgPicture.asset('assets/images/bell.svg'),'Notification',),
            const SizedBox(height: 26,),
            buildCardProfileScreen(SvgPicture.asset('assets/images/edit subject.svg'),'Edit Subject',),
            const SizedBox(height: 26,),
            InkWell(
              onTap: (){

                context.go('about us');
              },
              child: buildCardProfileScreen(SvgPicture.asset('assets/images/about_us.svg') ,'About Us'),
              ),

            const SizedBox(height: 26,),
            InkWell(
              onTap: () {
                 FirebaseAuth.instance.signOut();
                  router.pop();
                  router.go('/login');
              },
              child: buildCardProfileScreen(SvgPicture.asset('assets/images/logout.svg') ,'Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Card buildCardProfileScreen(SvgPicture image, String label ) {
    return Card( elevation: 2,shadowColor: Colors.grey,
            child: ListTile(
              leading:image,
              title: Text(label,style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 16)),

              trailing:label=="Notification"? SizedBox(
                width: 40,height: 30,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Switch(
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                    activeTrackColor: Colors.black,
                    trackOutlineColor: state?const MaterialStatePropertyAll(Colors.black):const MaterialStatePropertyAll(Colors.white),
                    splashRadius: 100,
                    value: state, onChanged: (bool value) { setState(() {state=value;}); },),
                ),
              ):null,
            ),
          );
  }
}
