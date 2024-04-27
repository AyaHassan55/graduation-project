
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grady/screens/about_us_screen.dart';
import 'package:grady/screens/authentication/welcome_screen.dart';
import 'package:grady/screens/edit_profile_screen.dart';


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
        leading:const Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading:
              // SvgPicture.asset('assets/images/girll.svg'),
              Container(
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
              title:const Text('Aya Hassan',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
              subtitle:const Text('Flutter Developer',style: TextStyle(fontFamily: 'Poppins',fontSize: 16)),
              trailing:InkWell(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditProfile()))
                  ,child: SvgPicture.asset('assets/images/edit.svg')),
            ),
            const SizedBox(height: 56,),
            Card( elevation: 2,shadowColor: Colors.grey,
              child: ListTile(
                leading:SvgPicture.asset('assets/images/bell.svg') ,
                title:const Text('Notification',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 16)),

                trailing:SizedBox(
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
                        value: state, onChanged: (bool value) { setState(() {state=value;}); },)),
                ),
              ),
            ),
            const SizedBox(height: 26,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutUsScreen()));
              },
              child: Card( elevation: 2,shadowColor: Colors.grey,
                child: ListTile(
                  leading:SvgPicture.asset('assets/images/about_us.svg') ,
                  title:const Text('About us',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 16)),

                ),
              ),
            ),
            const SizedBox(height: 26,),
            InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen())),
              child: Card(
                elevation: 2,shadowColor: Colors.grey,
                child: ListTile(
                  leading:SvgPicture.asset('assets/images/logout.svg') ,
                  title:const Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 16)),

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
