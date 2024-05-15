
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grady/Presentation/Screens/Authentication/login_screen.dart';
import 'package:grady/Presentation/Widgets/custom_text_field.dart';
import 'package:grady/Presentation/config/routes.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_state.dart';

class CustomSignUpForm extends StatefulWidget
{
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  // final TextEditingController controller =  TextEditingController();


 bool success =false;
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit=BlocProvider.of<AuthCubit>(context);

    return  BlocConsumer<AuthCubit, AuthState>(
       listener: (context, state)
    {
      if (state is SignUpSuccessState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Done',
          desc: ' Successfully , check your email to verify your account!',
          btnOkOnPress: () {
            context.go('/login',);
          },
          btnOkColor: Colors.green,
        ).show();

      } else if (state is SignUpFailureState) {
        state.errMessage == 'The password provided is too weak.'
            ? AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          desc: state.errMessage,
          btnOkOnPress: () {},
          btnOkColor: Colors.orangeAccent,
        ).show() : AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Error',
          desc:
          state.errMessage,
          btnOkOnPress: () {},
          btnOkColor: Colors.red,
        ).show();
      }
    },
    builder: (context, state) {
    return Form(
      key: authCubit.signupFormKey,
      child: Column(
      children: [
        CustomTextField(label:'Enter Your FullName', icon:  const Icon(Icons.person_2_outlined,color:Colors.black,),
          onChanged: (String name) {
            authCubit.fullName=name;
          },
            keyboardType:TextInputType.name
        ),
        const SizedBox(height: 22,),
        CustomTextField(label:'Enter Your Phone', icon:  const Icon(Icons.local_phone_rounded,color:Colors.black,) ,
            onChanged: (String phone) {
              authCubit.phone=phone;
            },
            keyboardType:TextInputType.phone
        ),
        const SizedBox(height: 22,),
        CustomTextField(label:'Enter Your Email', icon:  const Icon(Icons.email_outlined,color:Colors.black,) ,
            onChanged: (String emailAddress) {
              authCubit.email=emailAddress;
            },keyboardType:TextInputType.emailAddress ),
        const SizedBox(height: 22,),
        CustomTextField(
          label: 'Enter Your Password',
          icon:  const Icon(Icons.lock_outline_rounded,color:Colors.black,),
          suffixIcon: IconButton(
            icon: Icon(authCubit.obscurePasswordTextValue == true ? Icons.visibility_outlined : Icons.visibility_off_outlined,),
            onPressed: () {
              authCubit.obscurePasswordText();
            },
          ),
          obscureText: authCubit.obscurePasswordTextValue,
          onChanged: (password) {
            authCubit.password=password;
          },
        ),
        const SizedBox(height: 22,),
        CustomTextField(

          label: 'Confirm Password',
          icon:  const Icon(Icons.lock_outline_rounded,color:Colors.black,),
          suffixIcon: IconButton(
            icon: Icon(
              authCubit.obscureConfirmPasswordTextValue == true ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            ),
            onPressed: () {
              authCubit.obscureConfirmPasswordText();
            },
          ),
          obscureText: authCubit.obscureConfirmPasswordTextValue,
          onChanged: (password) {
            authCubit.confirmPassword = password;
          },
        ),
        const SizedBox(height: 60,),
        state is SignUpLoadingState? const CircularProgressIndicator(color: Colors.black,):
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: ()async {
            if(authCubit.signupFormKey.currentState!.validate()) {
              await authCubit.signUpWithEmailAndPassword();
              // router.go('/sub',);
            }

          },
            style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
            child:const Text('sign up',style:  TextStyle(color: Colors.white),),),
        )

      ],
    ),

    );
  },
);
  }
}