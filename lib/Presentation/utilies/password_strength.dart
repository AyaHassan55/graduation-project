//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_pw_validator/flutter_pw_validator.dart';
//
// import '../../bussinesLogic/cubit/auth_cubit/auth_state.dart';
//
//
// enum PasswordStrength { weak, medium, strong }
//
// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());
//
//   // Other existing methods and properties...
//
//   void validatePasswordStrength(String password) {
//     final pwValidator = FlutterPwValidator(
//       minLength: 6,
//       uppercaseCharCount: 2,
//       lowercaseCharCount: 2,
//       numericCharCount: 3,
//       specialCharCount: 1, width: 400, height: 150,
//       onSuccess: (){}, controller: null,
//     );
//
//     final strength = pwValidator.validate(password);
//     if (strength == PasswordValidationResult.strong) {
//       emit(PasswordStrengthState(PasswordStrength.strong));
//     } else if (strength == PasswordValidationResult.medium) {
//       emit(PasswordStrengthState(PasswordStrength.medium));
//     } else {
//       emit(PasswordStrengthState(PasswordStrength.weak));
//     }
//   }
// }
