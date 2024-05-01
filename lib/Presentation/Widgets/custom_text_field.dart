import 'package:flutter/material.dart';
import 'package:grady/Presentation/utilies/consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, required this.icon, this.suffixIcon,  this.onChanged,  this.onSubmitted});
  final String label;
  final Icon icon;
  final Icon? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      keyboardType: TextInputType.name,
      textAlign: TextAlign.start,
      cursorColor:Colors.black,
      cursorRadius: const Radius.circular(2),
      decoration: InputDecoration(
        labelText: label,
        labelStyle:const TextStyle(color: Colors.black),
        enabledBorder: myInputBorder(),
        focusedBorder: myInputBorder(),
        prefixIcon: icon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}