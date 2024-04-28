import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grady/Presentation/Screens/MainPages/courses_Screen.dart';
import 'package:grady/Presentation/Screens/MainPages/leaderboard_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/profile_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../Widgets/home_list_tile.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex=0;
  bool on=false;

  final List<Widget> _screens = [const HomeScreen(), const LeaderBoardScreen(), const CourseScreen(), const ProfileScreen(),
    // const CameraScreen()
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:_currentIndex == 0 ? Padding(
        padding: const EdgeInsets.only(top: 18.0,bottom: 18.0),
        child: ListView(
          children: [
            const HomeListTile(),
            const Padding(
              padding:  EdgeInsets.all(18.0),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 90.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text('Today',style: TextStyle(fontFamily:'Poppins'),),
                        Text('    Now',style: TextStyle(fontFamily: 'Poppins'),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 68.0),
                    child: Row (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sunday 10 March',style: TextStyle(fontFamily:'Poppins',fontWeight: FontWeight.bold),),
                        Text('12:00 AM',style: TextStyle(fontFamily: 'Poppins',color: Colors.black,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
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
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('  You wanna start recording ?',style: TextStyle(fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.bold),),
                      const Spacer(flex: 1,),
                      Center(child:  SvgPicture.asset('assets/images/undraw_video_files_fu10 1.svg')),
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
                          child: SvgPicture.asset('assets/images/camera-viewfinder 1.svg'),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Today's Leaderboard",style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 27.0),
                        child: Container(
                          width: 100,height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color:const Color.fromARGB(255, 239, 233, 233),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,children: [
                            const Text('Doctor Name'),
                            const SizedBox(height: 10,),
                            CircularPercentIndicator(
                              radius: 20,
                              // radius: 120.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.7,
                              progressColor: Colors.black,
                              center: const Text("70.0%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                              ),

                            ),
                          ],),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 38.0),
                        child: Container(
                          width: 70,
                          height: 60,
                          decoration:const BoxDecoration(

                            shape: BoxShape.circle,
                            image:  DecorationImage(
                                image:AssetImage('assets/images/boyy.png'),fit: BoxFit.cover ),


                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 27.0),
                        child: Container(
                          width: 140,height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color:const Color.fromARGB(255, 239, 233, 233),
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                            const SizedBox(height: 12,),
                            const Text('Doctor Name'),
                            const SizedBox(height: 16,),
                            CircularPercentIndicator(
                              radius: 20,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.95,
                              progressColor: Colors.black,
                              center: const Text("95.0%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                              ),

                            ),
                          ],),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 68.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration:const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              alignment: Alignment.center,
                              image:AssetImage('assets/images/cute_girl.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 27.0),
                        child: Container(
                          width: 100,height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                              color:const Color.fromARGB(255, 239, 233, 233)
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                            const Text('Doctor Name'),
                            const SizedBox(height: 12,),
                            CircularPercentIndicator(
                              radius: 20,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.88,
                              progressColor: Colors.black,
                              center: const Text("88.0%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                              ),

                            ),
                          ],),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 38.0),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration:const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:AssetImage('assets/images/bent.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ): _screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius:const BorderRadius.all(Radius.circular(25)),
          child: SalomonBottomBar(
            margin:const EdgeInsets.all(7),
            backgroundColor: Colors.black,
            selectedColorOpacity: 0.99,
            currentIndex: _currentIndex,
            onTap: (i) => setState(()  {_currentIndex = i; on=!on;}),
            items: [
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/home.svg',colorFilter: _currentIndex==0 ? const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn),height: 20), title:const Text("Home",style: TextStyle(color: Colors.black),), selectedColor: Colors.white),
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/leaderboard.svg',colorFilter: _currentIndex==1 ?const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn) , height: 20), title:const Text("LeaderBoard",style: TextStyle(color: Colors.black)), selectedColor: Colors.white,),
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/courses.svg',colorFilter: _currentIndex==2 ?const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 20), title:const Text("Courses",style: TextStyle(color: Colors.black)), selectedColor: Colors.white,),
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/icon_profile.svg',colorFilter: _currentIndex==3 ?const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 20), title:const Text("Profile",style: TextStyle(color: Colors.black)), selectedColor: Colors.white,),
              SalomonBottomBarItem(icon:SvgPicture.asset('assets/icons/camera.svg',colorFilter: _currentIndex==4 ?const ColorFilter.mode(Colors.black, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 20), title:const Text("Camera",style: TextStyle(color: Colors.black)), selectedColor: Colors.white,),
            ],

          ),
        ),
      ),

    );

  }





}


