import 'package:flutter/material.dart';
import 'package:grady/Presentation/utilies/consts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;

   const CustomTextFormField( {super.key,
    required this.hintText,
     required this.prefixIcon, this.suffixIcon, this.controller, this.validator, this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: _getKeyboardType(),
      textAlign: TextAlign.start,
      cursorColor: Colors.black,
      cursorRadius: const Radius.circular(2),
      decoration: InputDecoration(
        enabledBorder: myInputBorder(),
        focusedBorder: myInputBorder(),
        labelText: hintText,
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
      obscureText: obscure,
      validator: validator,
    );
  }

  TextInputType _getKeyboardType() {
    if (hintText.toLowerCase().contains('email')) {
      return TextInputType.emailAddress;
    } else if (hintText.toLowerCase().contains('phone')) {
      return TextInputType.phone;
    }
    return TextInputType.text;
  }


}