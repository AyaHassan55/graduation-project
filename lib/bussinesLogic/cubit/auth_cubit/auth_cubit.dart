import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
   AuthCubit() : super(AuthInitial());
   String? fullName;
   String? phone;
   String? email;
   String? password;
   String? confirmPassword;
   bool? obscurePasswordTextValue = true;
   bool? obscureConfirmPasswordTextValue = true;
   GlobalKey<FormState> signupFormKey = GlobalKey();
   GlobalKey<FormState> signInFormKey = GlobalKey();
   GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  signUpWithEmailAndPassword( ) async{
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      verifyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(errMessage: 'The account already exists for that email.'));
      }else if (e.code == 'invalid-email') {
        emit(SignUpFailureState(errMessage: 'The email is invalid'));
      }
      else{
        emit(SignUpFailureState(errMessage: e.code));
      }
    } catch (e) {
      log('may be we are the problem $e');
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }
   void obscurePasswordText() {
     if (obscurePasswordTextValue == true) {
       obscurePasswordTextValue = false;
     } else {
       obscurePasswordTextValue = true;
     }
     emit(ObscurePasswordTextUpdateState());
   }
   void obscureConfirmPasswordText() {
     if (obscureConfirmPasswordTextValue == true) {
       obscureConfirmPasswordTextValue = false;
     } else {
       obscureConfirmPasswordTextValue = true;
     }
     emit(ObscureConfirmPasswordTextUpdateState());
   }
   Future<void>signInWithEmailAndPassword()async{
     try {
       emit(SignInLoadingState());
        await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: email!,
           password: password!
       );
        emit(SignInSuccessState());
     } on FirebaseAuthException catch (e) {
       if (e.code == 'user-not-found') {
         emit(SignInFailureState(errorMessage: 'No user found for that email.'));

       } else if (e.code == 'wrong-password') {
         emit(SignInFailureState(errorMessage: 'Wrong password provided for that user.'));
       }else {
         emit(SignInFailureState(errorMessage: 'Check your Email and password!'));
     }
   }catch(e){
       emit(SignInFailureState(errorMessage: e.toString()));
     }

}

   verifyEmail()async{
   await FirebaseAuth.instance.currentUser!.sendEmailVerification();
}
   resetPasswordWithLink()async {
     try {
       emit(ResetPasswordLoadingState());
       await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
       emit(ResetPasswordSuccessState());
     } catch (e) {
         emit(ResetPasswordFailureState(errorMessage: e.toString()));
     }
   }



}
