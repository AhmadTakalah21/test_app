part of '../auth_cubit.dart';

@immutable
abstract class PasswordComplexityState extends AuthState {}

class PasswordComplexityInitial extends PasswordComplexityState {}

class PasswordComplexitySuccess extends PasswordComplexityState {
  PasswordComplexitySuccess(this.passStrength);
  final PasswordStrengthModel passStrength;
}

class PasswordComplexityLoading extends PasswordComplexityState {}

class PasswordComplexityFail extends PasswordComplexityState {
  PasswordComplexityFail(this.error);

  final String error;
}
