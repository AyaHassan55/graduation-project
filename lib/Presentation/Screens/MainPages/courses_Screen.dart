import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grady/Presentation/Screens/MainPages/final_report.dart';
import 'package:grady/Presentation/config/routes.dart';
class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}
class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Courses',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 20),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            router.go('/home');
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Column(
            children: [
              Divider(height: 2, thickness: 1, color: Colors.grey[200]),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error fetching data'));
                  }

                  final List<ExpansionPanelRadio> courseWidgets = [];

                  for (var doc in snapshot.data!.docs) {
                    final userData = doc.data() as Map<String, dynamic>;
                    final subjectName = userData['subject name'] ?? '';

                    courseWidgets.add(renderCourse(subjectName, doc.id,context));
                  }


                  return ExpansionPanelList.radio(
                    elevation: 2,
                    dividerColor: Colors.grey[200],
                    animationDuration: const Duration(seconds: 1),
                    children: courseWidgets,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ExpansionPanelRadio renderCourse(String subjectName, String userId, BuildContext context) {
  return ExpansionPanelRadio(
    value: subjectName,
    backgroundColor: Colors.white,
    headerBuilder: (context, bool isExpanded) => ListTile(
      leading: Text(
        subjectName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          fontSize: 15,
        ),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FinalReport(userId: userId),
                ),
              );
            },
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: SvgPicture.asset('assets/images/report_img.svg'),
                title: const Text('Report'),
              ),
            ),
          ),
          const SizedBox(height: 17),
        ],
      ),
    ),
  );
}

