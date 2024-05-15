
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import '../../bussinesLogic/cubit/auth_cubit/auth_state.dart';
import '../config/routes.dart';
import 'custom_text_field.dart';

class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
      if (state is ResetPasswordSuccessState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Done',
          desc: 'check your email to reset password',
          btnOkOnPress: () {router.go('/login');},
          btnOkColor: Colors.green,
        ).show();

      }else if(state is ResetPasswordFailureState){
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          desc: state.errorMessage,
          btnOkOnPress: () {},
          btnOkColor: Colors.red,
        ).show();
      }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.forgotPasswordFormKey,
          child:  Column(
            children: [
              CustomTextField(
                label: 'Enter Your Email',
                icon:const Icon(Icons.email_outlined,),
                onChanged: (email) {
                  authCubit.email = email;
                },

              ),
                 const SizedBox(height: 160,),
              state is SignInLoadingState
                  ? const CircularProgressIndicator(color: Colors.black)
                  : SizedBox(width: double.infinity, height: 50, child: ElevatedButton(
                onPressed: ()async {
                  if(authCubit.forgotPasswordFormKey.currentState!.validate()){
                    await authCubit.resetPasswordWithLink();

                  }
                },
                style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
                child:const  Text('Reset password',style: TextStyle(color: Colors.white),),),
              ),
            ],
          ),
        );
      },
    );
  }
}