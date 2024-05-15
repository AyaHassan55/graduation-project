import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AuthCubit extends Cubit<AuthState> {
   AuthCubit() : super(AuthInitial());
   String? fullName;
   String? phone;
   String? email;
   String? password;
   String? confirmPassword;
    String? subjectName;
   String? documentId;
   bool? obscurePasswordTextValue = true;
   bool? obscureConfirmPasswordTextValue = true;
   GlobalKey<FormState> signupFormKey = GlobalKey();
   GlobalKey<FormState> signInFormKey = GlobalKey();
   GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
   GlobalKey<FormState> subjectNameFormKey = GlobalKey();
  signUpWithEmailAndPassword( ) async{
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!,);
       await addUserProfile();
       await verifyEmail();
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

   void updateSubjectName(String name) {
     subjectName = name;
   }
   Future<void> addUserProfile() async {
     CollectionReference users = FirebaseFirestore.instance.collection('users');
     DocumentReference docRef = await users.add({
       'FullName': fullName,
       'Email': email,
       'Password': password,
       'Phone': phone,
     });
     documentId = docRef.id;
     emit(SignUpSuccessState());
     log('Document Id=  $documentId');
   }

   Future<void> addUserSubject() async {
     log('Aya 345 > $documentId');
     if (documentId != null) {
       CollectionReference users = FirebaseFirestore.instance.collection('users');
       await users.doc(documentId).update({'subject_name': subjectName});
     } else {
       log("Document ID is null. Ensure you have added the user profile first.");
     }
   }



}
