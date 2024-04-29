
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SecondPlaceLeaderBoard extends StatelessWidget {
  const SecondPlaceLeaderBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

class FirstPlaceLeaderBoard extends StatelessWidget {
  const FirstPlaceLeaderBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

class ThirdPlaceLeaderBoard extends StatelessWidget {
  const ThirdPlaceLeaderBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}