import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../config/routes.dart';
class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Leaderboard'),
         leading: InkWell(onTap: ()=>router.go('/home'),child:const Icon(Icons.arrow_back_ios,color:Colors.black)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .orderBy('Percentage', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }

          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();
              final Map<String, dynamic>? userData = data as Map<String, dynamic>?;
              final name = userData?['name'] ?? '';
              final percentage = userData?['Percentage'] ?? 0.0;
              final imageUrl = userData?['profilePicture'] ?? '';
              final formattedPercentage = percentage.toStringAsFixed(1);
              return SizedBox(
                height: 70,
                child: Card(

                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      backgroundImage: imageUrl !='' ?NetworkImage(imageUrl):const AssetImage('assets/images/account.png') as ImageProvider,
                    ),
                    title: Text(name),
                    trailing: CircularPercentIndicator(
                      radius: 25,
                      lineWidth: 5.0,
                      progressColor: Colors.black,
                      animation: true,
                       percent: percentage / 100.00,
                      center: Text('$formattedPercentage%',style:const TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),),

                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
