import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading:const Icon(Icons.arrow_back_ios,color: Colors.black,),
        title:const Text('Leaderboard',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20),),
      ),
      body:leaderBoardList(),
    );
  }
  Padding leaderBoardList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: 19,
          itemBuilder: (context,index){
            return   Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(

                margin:const  EdgeInsets.all(8),
                elevation: 5,
                shadowColor: Colors.grey,

                child: Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading:const CircleAvatar(radius:30,backgroundImage: AssetImage('assets/images/bent.png',),backgroundColor: Colors.transparent,),
                    title:const Text('Doctor Name',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 15)),
                    trailing:CircularPercentIndicator(
                      radius: 20,
                      lineWidth: 5.0,
                      animation: true,
                      percent: 0.88,
                      progressColor: Colors.black,
                      center: const Text("88.0%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                      ),

                    ),
                  ),
                ),

              ),
            );
          }),
    );
  }
}
