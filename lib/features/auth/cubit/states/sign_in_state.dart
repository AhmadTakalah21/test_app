part of '../auth_cubit.dart';

@immutable
sealed class SignInState extends AuthState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  SignInSuccess(this.auth);
  final AuthResultModel auth;
}

class SignInFail extends SignInState {
  SignInFail(this.message);
  final String message;
}
