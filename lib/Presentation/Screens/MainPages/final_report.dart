import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import '../../config/routes.dart';

class FinalReport extends StatefulWidget {
  final String userId;
  const FinalReport({super.key, required this.userId});

  @override
  State<FinalReport> createState() => _FinalReportState();
}

class _FinalReportState extends State<FinalReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
        leading: InkWell(
          onTap: () {
            router.go('/courses');
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading graph data'),
            );
          }
          var userData = snapshot.data!.data() as Map<String, dynamic>;
          String graph = userData['graphUrl'] ?? '';
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Lecture Graph', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              graph.isNotEmpty
                  ? Image.network(
                graph,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black,),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text('Error loading image'),
                  );
                },
              )
                  :  Column(
                    children: [
                      SvgPicture.asset('assets/images/undraw_emptyl.svg'),

                    ],
                  ),
            ],
          );
        },
      ),
    );
  }
}
