import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../authentication/welcome_screen.dart';
import 'package:grady/Presentation/config/routes.dart' ;
import 'package:go_router/go_router.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);
  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}
class _BoardingScreenState extends State<BoardingScreen> {
  late int index;
  PageController controller=PageController();
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/logo_name.svg'),
                Padding(
                  padding: const EdgeInsets.only( top:38.0),
                  child: SvgPicture.asset('assets/images/on1.svg',width: 349,height: 244,),

                ),
                const Padding(
                  padding: EdgeInsets.only(top: 54.0,left: 8.0),
                  child: Text('Video analytics', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,fontFamily: 'Inter'),),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text('to analyze and monitor students engagement\nlevels during lectures. By analyzing facial\nexpressions and body language.', style: TextStyle(fontSize: 14,fontFamily: 'Inter')),
                ),

              ],
            ),
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: SvgPicture.asset('assets/images/logo_name.svg'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 58.0),
                child: SvgPicture.asset('assets/images/on2.svg',height: 280,),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 58.0,left: 18.0),
                child:  Text('the automated attendance-taking system.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Inter'),),
              ),
              const Padding(
                padding:  EdgeInsets.only(left: 18.0,bottom: 30),
                child:  Text('This not only saves valuable class time but\n also ensures accurate attendance records\nthat can be securely accessed by administrators.',style: TextStyle(fontSize: 14,fontFamily: 'Inter')),
              ),

            ],

          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/logo_name.svg'),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: SvgPicture.asset('assets/images/on3.svg'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 58.0,left: 8.0),
                  child:  Text('identify when a student becomes distracted.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Inter'),),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text('we provide real-time notifications to\nprofessors, enabling them to address\nstudents\' attention lapses promptly administrators. ',style: TextStyle(fontSize: 14,fontFamily: 'Inter')),
                ),

              ],

            ),
          ),

        ),
      ),
    ),
  ];
  @override
  void initState() {
    super.initState();
    index = 0;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Onboarding(
            pages: onboardingPagesList,
            startPageIndex: 0,
            onPageChange: (int pageIndex) {
              setState(() {
                index = pageIndex;
              });
            },


            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 0.0,
                    color: Colors.white,
                  ),
                ),
                child: ColoredBox(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(45.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedSmoothIndicator(
                              activeIndex: index,
                              count: 3,
                              effect:const WormEffect(dotColor: Colors.grey, activeDotColor: Colors.black, dotHeight: 5.0, dotWidth: 32.0),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          index<2? TextButton(
                            onPressed: () {
                              setState(() {
                                index=2;
                                setIndex(2);
                              });
                            },
                            child:const  Text(
                              'Skip',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'
                              ),
                            ),
                          ):const Text(''),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style:const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.black),
                              ),
                              onPressed: () {

                                if (index < onboardingPagesList.length  - 1) {
                                  setState(() {index++;setIndex(index);});
                                } else {
                                  context.go('/welcome');
                                }
                              },
                              child:const Text('Next' , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}