
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/model/course_model.dart';



class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('Courses',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
        centerTitle: true,
        leading:const Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Column(
            children: [
              Divider(height: 2,thickness: 1,color: Colors.grey[200],),
              Container(
                child: _renderCourse(courses),
              ),
            ],
          ),
        ),
      ),

    );
  }
  Widget _renderCourse(List<Course>courses){
    return ExpansionPanelList.radio(
      elevation: 2,
      dividerColor: Colors.grey[200],
      animationDuration: const Duration(seconds: 1),
      // expansionCallback: (int index,bool isExpanded)=>,
      children: courses.map<ExpansionPanelRadio>((Course courses){
        return ExpansionPanelRadio(
            value: courses.courseName,
            backgroundColor: Colors.white,
            headerBuilder: (context,bool isExpanded)=>ListTile(leading:Text( courses.courseName,style:const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 15)),),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(elevation: 2,
                    child: ListTile(leading:SvgPicture.asset('assets/images/report_img.svg'),title: Text(courses.bodyOne)),
                  ),
                  const SizedBox(height: 17,),
                  Card(elevation: 2,
                    child: ListTile(leading:SvgPicture.asset('assets/images/about_us.svg'),title: Text(courses.bodyTwo)),
                  ),
                ],
              ),
            ));
      }).toList(),
    );
  }
}
