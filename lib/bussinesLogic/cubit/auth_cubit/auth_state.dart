
 class AuthState {}

final class AuthInitial extends AuthState {}
final class SignUpLoadingState extends AuthState {}
final class SignUpSuccessState extends AuthState {}
final class SignUpFailureState extends AuthState {
 final String errMessage;

  SignUpFailureState({required this.errMessage});
}

 final class ObscurePasswordTextUpdateState extends AuthState {}
 final class ObscureConfirmPasswordTextUpdateState extends AuthState {}


 final class PasswordStrengthState extends AuthState {}
 final class WeakPasswordState extends AuthState {}
 final class SignInLoadingState extends AuthState {}
 final class SignInSuccessState extends AuthState {}
 final class SignInFailureState extends AuthState {
  final String errorMessage;

  SignInFailureState({required this.errorMessage});
 }
 final class ResetPasswordLoadingState extends AuthState {}
 final class ResetPasswordSuccessState extends AuthState {}
 final class ResetPasswordFailureState extends AuthState {
  final String errorMessage;

  ResetPasswordFailureState({required this.errorMessage});
 }
