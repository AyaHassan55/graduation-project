import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubjectName extends StatelessWidget {
  const SubjectName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          SvgPicture.asset('assets/images/subject.svg'),
          TextFormField(

          ),
        ],
      ),
    );
  }
}
