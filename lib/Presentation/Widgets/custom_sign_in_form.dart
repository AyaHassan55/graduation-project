import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grady/Presentation/Screens/Authentication/login_screen.dart';
import 'package:grady/Presentation/Screens/MainPages/home_screen.dart';
import 'package:grady/Presentation/Widgets/forget_password_text_widget.dart';

import '../../bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import '../../bussinesLogic/cubit/auth_cubit/auth_state.dart';
import '../config/routes.dart';
import 'custom_text_field.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          log('May be i am the problemmmmm');
            router.go('/home');


        } else if (state is SignInFailureState) {
          log('wronggggPAssswordddddddd');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            desc: state.errorMessage,
            btnOkOnPress: () {},
            btnOkColor: Colors.red,
          ).show();
        }else{
          log('it canttttttttttt!');
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signInFormKey,
          child:  Column(
            children: [
               CustomTextField(
                label: 'Enter Your Email',
                icon:const Icon(Icons.email_outlined,),
                onChanged: (email) {
                  authCubit.email = email;
                },

              ),
              const SizedBox(height: 22,),
              CustomTextField(
                label: 'Enter Your Password',
                icon: const Icon(Icons.email_outlined),
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                obscureText: authCubit.obscurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),

              const ForgotPasswordTextWidget(),
              const SizedBox(height: 80),
              state is SignInLoadingState
                  ? const CircularProgressIndicator(color: Colors.black)
                  : SizedBox(width: double.infinity, height: 50, child: ElevatedButton(
                  onPressed: ()async {
                    if(authCubit.signInFormKey.currentState!.validate()){
                      await authCubit.signInWithEmailAndPassword();

                    }
                  },
                  style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
                  child:const  Text('Login',style: TextStyle(color: Colors.white),),),
              ),
            ],
          ),
        );
      },
    );
  }
}