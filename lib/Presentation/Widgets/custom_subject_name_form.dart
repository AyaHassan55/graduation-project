import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grady/Presentation/Widgets/custom_text_field.dart';
import 'package:grady/Presentation/config/routes.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_state.dart';

class CustomSubjectNameForm extends StatefulWidget
{
  const CustomSubjectNameForm({super.key});

  @override
  State<CustomSubjectNameForm> createState() => _CustomSubjectNameForm();
}

class _CustomSubjectNameForm extends State<CustomSubjectNameForm> {
  @override
  Widget build(BuildContext context) {
    String subject='';
    return  BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state)
      {
      },
      builder: (context, state) {
        AuthCubit authCubit=BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.subjectNameFormKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0,bottom: 12),
                    child: SvgPicture.asset('assets/images/subject.svg'),
                  ),
                  CustomTextField(label:'Enter subject Name', icon:  const Icon(Icons.note_alt_outlined,color:Colors.black,),
                      keyboardType:TextInputType.name,
                    onChanged: (String subject) {
                      // Pass entered subject to AuthCubit
                      authCubit.updateSubjectName(subject);
                      log(subject);
                    },
                  ),
                  const SizedBox(height: 360,),
                  state is SignUpLoadingState? const CircularProgressIndicator(color: Colors.black,):
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async{
                        if(authCubit.subjectNameFormKey.currentState!.validate()){
                          await authCubit.addUserSubject();
                          log('donnnne adding subject');
                          router.go('/home',
                          );

                        }
                      },
                      style: ElevatedButton.styleFrom(shadowColor: Colors.grey,elevation: 5,backgroundColor: Colors.black,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
                      child:const Text('Save',style:  TextStyle(color: Colors.white),),),
                  )
              
                ],
              ),
            ),
          ),

        );
      },
    );
  }
}