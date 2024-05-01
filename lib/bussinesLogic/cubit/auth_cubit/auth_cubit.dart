import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  late String? fullName;
  late String? phone;
  late String? email;
  late String? password;

  signUpWithEmailAndPassword( ) async{
    try {
      emit(SignUpLoadingState());
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(errMessage:'The password provided is too weak.'));

      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(errMessage:'The account already exists for that email.'));

      }
    } catch (e) {
      emit(SignUpFailureState(errMessage:e.toString()));
    }
  }
}
