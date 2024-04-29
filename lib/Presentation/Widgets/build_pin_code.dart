import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class BuildPinCode extends StatelessWidget {
  const BuildPinCode({
    super.key,
    required this.formKey,
    required this.hasError,
  });

  final GlobalKey<FormState> formKey;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Form(
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

    );
  }
}