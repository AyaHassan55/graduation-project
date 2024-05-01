import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grady/Presentation/Widgets/custom_text_field.dart';
import 'package:grady/Presentation/utilies/custom_button.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_state.dart';

class CustomSignUpForm extends StatelessWidget
{
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Form(child: Column(
      children: [
        CustomTextField(label:'Enter Your FullName', icon:  const Icon(Icons.person_2_outlined,color:Colors.black,),
          onChanged: (String name) {
          BlocProvider.of<AuthCubit>(context).fullName=name;
          }
        ),
        const SizedBox(height: 22,),
        CustomTextField(label:'Enter Your Phone', icon:  const Icon(Icons.local_phone_rounded,color:Colors.black,) ,
            onChanged: (String phone) {
              BlocProvider.of<AuthCubit>(context).phone=phone;
            }),
        const SizedBox(height: 22,),

        CustomTextField(label:'Enter Your Email', icon:  const Icon(Icons.email_outlined,color:Colors.black,) ,
            onChanged: (String emailAddress) {
          BlocProvider.of<AuthCubit>(context).email=emailAddress;
            }),
        const SizedBox(height: 22,),

        CustomTextField(label:'Enter Your Password', icon:  const Icon(Icons.lock_outline_rounded,color:Colors.black,) ,onChanged: (String password) {
          BlocProvider.of<AuthCubit>(context).password=password;
        }),
        const SizedBox(height: 22,),

        CustomTextField(label:'Confirm Password', icon:  const Icon(Icons.lock_outline_rounded,color:Colors.black,) ,onChanged: (String password) {}),
        const SizedBox(height: 80,),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(onPressed: () {
            BlocProvider.of<AuthCubit>(context).signUpWithEmailAndPassword();
            GoRouter.of(context).push('/home');
          },
            style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
            child:const Text('Sign Up',style:  TextStyle(color: Colors.white),),),
        )

      ],
    ),

    );
  },
);
  }
}