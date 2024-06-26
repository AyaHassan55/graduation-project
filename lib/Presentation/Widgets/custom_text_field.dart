import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grady/Presentation/utilies/consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({ Key? key, required this.label, required this.icon,
    this.suffixIcon,  this.onChanged,  this.onSubmitted, this.obscureText,this.keyboardType,this.validator,}): super(key: key);
  final String label;
  final Icon icon;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator:validator,
      //     (value){
      //   if(value!.isEmpty){
      //     return '* This field is required';
      //   }
      //   return null;
      //
      // },

      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
       keyboardType: keyboardType,
      textAlign: TextAlign.start,
      cursorColor:Colors.black,
      cursorRadius: const Radius.circular(2),
      obscureText: obscureText ?? false,

      decoration: InputDecoration(
        labelText: label,
        labelStyle:const TextStyle(color: Colors.black),
        border: myInputBorder(),
        enabledBorder: myInputBorder(),
        focusedBorder: myInputBorder(),
        prefixIcon: icon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

