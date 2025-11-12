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

// class PasswordValidationState extends PasswordComplexityState {
//   final bool isValidLength;
//   final bool isValidUpperCase;
//   final bool isValidLowerCase;
//   final bool isValidDigit;
//   final bool isValidNonAlphanumeric;

//   PasswordValidationState(
//     this.isValidLength,
//     this.isValidUpperCase,
//     this.isValidLowerCase,
//     this.isValidDigit,
//     this.isValidNonAlphanumeric,
//   );
// }
