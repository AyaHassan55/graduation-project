import 'package:flutter/material.dart';

import '../../components/consts.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Enter new password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 33),),
                  const SizedBox(height: 20,),
                  const Text("your new password must be different from",style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("previous used password",style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30,),
                  TextFormField(
                    obscureText: !isVisible,
                    obscuringCharacter: '*',
                    textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(2),
                    decoration: InputDecoration(
                      enabledBorder: myInputBorder(),
                      focusedBorder: myInputBorder(),
                      labelText: 'Enter Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.black,
                      ),
                      suffixIcon: isVisible ?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    ),
                  ),
                  const SizedBox(height: 160,),
                  SizedBox(width: double.infinity,height: 50,child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))), child:const Text('Reset password',style: TextStyle(color: Colors.white),),)),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}