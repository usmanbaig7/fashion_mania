part of 'sign_in_cubit.dart';

class SignInState {
  const SignInState({this.obscurePassword = true});

  final bool obscurePassword;

  SignInState copyWith({bool? obscurePassword}) {
    return SignInState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}
