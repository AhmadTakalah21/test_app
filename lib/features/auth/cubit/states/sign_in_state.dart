part of '../auth_cubit.dart';

@immutable
abstract class SignInState extends AuthState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {
  SignInSuccess(this.signInModel, this.message);

  final SignInModel signInModel;
  final String message;
}

class SignUpSuccess extends SignInState {
  SignUpSuccess(this.signInModel, this.message);

  final SignInModel signInModel;
  final String message;
}

class SignInLoading extends SignInState {}

class SignInFail extends SignInState {
  SignInFail(this.error);

  final String error;
}

class LogOutSuccess extends SignInState {
  final String message;
  LogOutSuccess(this.message);
}
