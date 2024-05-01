import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: ()=> GoRouter.of(context).push('/forgetPassword'),

        child: const Align(alignment: Alignment.bottomRight, child: Text('Forget Password ?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        ),
    );
  }
}
