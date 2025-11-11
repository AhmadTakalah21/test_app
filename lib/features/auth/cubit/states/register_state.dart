part of '../auth_cubit.dart';

@immutable
abstract class RegisterState extends AuthState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  RegisterSuccess(this.model);
  final RegisterResultModel model;
}

class RegisterLoading extends RegisterState {}

class RegisterFail extends RegisterState {
  RegisterFail(this.error);

  final String error;
}
