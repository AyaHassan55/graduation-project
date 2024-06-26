import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grady/Presentation/Widgets/custom_text_field.dart';
import 'package:grady/Presentation/config/routes.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_state.dart';
import '../../core/database/cache/chach_helper.dart';
import '../../core/services/service_locator.dart';
class CustomSubjectNameForm extends StatefulWidget
{
  const CustomSubjectNameForm({super.key});
  @override
  State<CustomSubjectNameForm> createState() => _CustomSubjectNameForm();
}
class _CustomSubjectNameForm extends State<CustomSubjectNameForm> {
  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
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
                  state is UpdateSubjectNameLoadingState? const CircularProgressIndicator(color: Colors.black,):
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async{

                        if(authCubit.subjectNameFormKey.currentState!.validate()){
                          final userId = authCubit.userId;
                          if (userId != null) {
                            await authCubit.updateSubjectNameInFireStore(userId, authCubit.subjectName!);
                            await authCubit.addOrUpdateSubject(userId, authCubit.subjectName!);
                            getIt<CacheHelper>().saveData(key: 'isSubjectScreenVisited', value: true);
                            router.go('/home');

                          } else {
                            log('User ID is null');
                          }



                        }else{
                          const CircularProgressIndicator(color: Colors.red,);
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