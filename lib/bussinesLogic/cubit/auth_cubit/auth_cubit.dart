import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_state.dart';
import '../../../core/model/user_model.dart';
class AuthCubit extends Cubit<AuthState> {
   AuthCubit() : super(AuthInitial());
   String? fullName;String? phone;String? email;String? password;String? subjectName;String? confirmPassword;String? documentId;
   String?img; String?userId;
   bool? obscurePasswordTextValue = true;
   bool? obscureConfirmPasswordTextValue = true;
   GlobalKey<FormState> signupFormKey = GlobalKey();
   GlobalKey<FormState> signInFormKey = GlobalKey();
   GlobalKey<FormState> subjectNameFormKey = GlobalKey();
   GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
   GlobalKey<FormState> emailFormKey = GlobalKey();
   GlobalKey<FormState> imageKey = GlobalKey();

  signUpWithEmailAndPassword( ) async{
    try {
      emit(SignUpLoadingState());
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      userId = userCredential.user!.uid;
      await saveUserToFireStore(UserModel(name: fullName!, email: email!, profilePicture: img, userId: userId, subjectName: null, password: password!, percentage: null, graphImage: '', phone: phone!));

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
       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: email!,
           password: password!
       );
       userId = userCredential.user!.uid;


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
  void updateSubjectName(String name) async{
    subjectName=name;
  }

   saveUserToFireStore(UserModel user){
    final currentUser= FirebaseAuth.instance.currentUser;
    final  userId=currentUser!.uid;
    final fireStoreInstance=FirebaseFirestore.instance;
    final userData=user.toJson();
    fireStoreInstance.collection('users').doc(userId).set(userData).then((_) {
      log('user data save successfully');
    }).catchError((e) {
      log('Failed to add user');
    });
  }
   Future<UserModel> getUserInfo(String userId) async {
     final fireStoreInstance = FirebaseFirestore.instance;
     final userDoc =
     await fireStoreInstance.collection('users').doc(userId).get();
     if (userDoc.exists) {
       final userdata = userDoc.data();

       return UserModel.fromJson(userdata!);
     } else {
       return UserModel(name: 'Unknown', email: 'em', profilePicture: 'im', password: 'p', percentage: null, userId: 'ii', subjectName: 'ss', graphImage: '', phone: '');
     }
   }
   Future<void> updateSubjectNameInFireStore(String userId, String newSubjectName) async {
     try {
       emit(UpdateSubjectNameLoadingState());

       final fireStoreInstance = FirebaseFirestore.instance;
       await fireStoreInstance.collection('users').doc(userId).update({
         'subject name': newSubjectName,
       });

       // Update local subjectName
       subjectName = newSubjectName;
       emit(UpdateSubjectNameSuccessState());
     } catch (e) {
       emit(UpdateSubjectNameFailureState(errorMessage: e.toString()));
     }
   }
   Future<void> addOrUpdateSubject(String userId, String newSubjectName) async {
     try {
       emit(UpdateSubjectNameLoadingState());

       final firestoreInstance = FirebaseFirestore.instance;

       // Update the 'subject' field directly in the user's document
       await firestoreInstance.collection('users').doc(userId).update({
         'subject': newSubjectName,
       });

       emit(UpdateSubjectNameSuccessState());
     } catch (e) {
       emit(UpdateSubjectNameFailureState(errorMessage: e.toString()));
     }
   }

   Future<void> uploadImage(File file) async {
     try {
       final user = FirebaseAuth.instance.currentUser;
       if (user == null) {
         throw Exception('No user logged in');
       }

       final storageRef = FirebaseStorage.instance.ref().child('profile_pictures/${user.uid}.png');
       await storageRef.putFile(file);

       final downloadUrl = await storageRef.getDownloadURL();
       await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
         'profilePicture': downloadUrl,
       });

       emit(UploadImageSuccessState());

     } catch (e) {
       emit(UploadImageFailureState(errorMessage: e.toString()));
     }
   }

}



