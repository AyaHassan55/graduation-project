import 'package:flutter/material.dart';
import '../../Widgets/custom_subject_name_form.dart';
class SubjectName extends StatelessWidget {
  const SubjectName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomSubjectNameForm(),

    );
  }
}