import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Screens/MainPages/home_screen.dart';
class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            List<User> users = snapshot.data!.docs.map((doc) => User.fromFirestore(doc)).toList();
            users.sort((a, b) => b.percentage.compareTo(a.percentage));

            return Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                children: [
                  if (users.isNotEmpty) FirstPlaceLeaderBoard(user: users[0]),
                  if (users.length > 1) const SizedBox(height: 20),
                  if (users.length > 1) SecondPlaceLeaderBoard(user: users[1]),
                  if (users.length > 2) const SizedBox(height: 20),
                  if (users.length > 2) ThirdPlaceLeaderBoard(user: users[2]),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class FirstPlaceLeaderBoard extends StatelessWidget {
  final User user;

  const FirstPlaceLeaderBoard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 27.0),
          child: Container(
            width: 140,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 239, 233, 233),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                Text(user.name),
                const SizedBox(height: 16),
                CircularPercentIndicator(
                  radius: 20,
                  lineWidth: 5.0,
                  animation: true,
                  percent: user.percentage,
                  progressColor: Colors.black,
                  center: Text(
                    "${(user.percentage * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 48.0),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SecondPlaceLeaderBoard extends StatelessWidget {
  final User user;

  const SecondPlaceLeaderBoard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 27.0),
          child: Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 239, 233, 233),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(user.name)),
                const SizedBox(height: 12),
                CircularPercentIndicator(
                  radius: 20,
                  lineWidth: 5.0,
                  animation: true,
                  percent: user.percentage,
                  progressColor: Colors.black,
                  center: Text(
                    "${(user.percentage * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 38.0),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user.imagePath),
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
  final User user;

  const ThirdPlaceLeaderBoard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 27.0),
          child: Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 239, 233, 233),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.name),
                const SizedBox(height: 10),
                CircularPercentIndicator(
                  radius: 20,
                  lineWidth: 5.0,
                  animation: true,
                  percent: user.percentage,
                  progressColor: Colors.black,
                  center: Text(
                    "${(user.percentage * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 38.0),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
