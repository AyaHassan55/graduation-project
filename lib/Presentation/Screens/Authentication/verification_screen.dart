import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}


class _VerificationScreenState extends State<VerificationScreen> {

  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CupertinoColors.white,
        appBar: AppBar(
          backgroundColor: CupertinoColors.white,
          leading:const Icon(Icons.arrow_back_ios,color: CupertinoColors.black,),
        ),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Verify your email',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 33),),
                  const SizedBox(height: 20,),
                  const Text("Please write the numbers we have sent to",style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("your email",style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30,),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 30.0),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle:const TextStyle(color: Colors.grey), length: 4,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 50,

                          inactiveColor: Colors.grey.shade200,
                          inactiveFillColor: Colors.grey.shade200,
                          activeFillColor: Colors.white,
                          disabledColor: Colors.grey.withOpacity(0.5),
                          errorBorderColor: hasError ? Colors.red : Colors.transparent,
                          selectedColor: Colors.grey,
                          selectedFillColor: Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                      ),
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 120.0),
                    child: Text(
                      hasError ? "*Please enter correct otp number" : "",
                      style: const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive the code?",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () => snackBar("OTP resend!!"),
                        child: const Text(
                          "Resend Code",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),

                  const SizedBox(height: 160,),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          if (currentText.length != 4 || currentText != "1234")
                          {
                            errorController!.add(ErrorAnimationType.shake);
                            setState(() => hasError = true);
                          } else {
                            setState(
                                  () {
                                hasError = false;
                                snackBar("OTP Verified!!");
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(shadowColor: Colors.grey,
                            elevation: 5,
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)))),
                        child: const Text(
                          'Verify', style: TextStyle(color: Colors.white),),)),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


