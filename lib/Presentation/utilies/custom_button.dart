
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key,required this.text, required this.pageName});

  final String text, pageName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: ()=>GoRouter.of(context).push(pageName),
        style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
        child: Text(text,style: const TextStyle(color: Colors.white),),),
    );

  }
}