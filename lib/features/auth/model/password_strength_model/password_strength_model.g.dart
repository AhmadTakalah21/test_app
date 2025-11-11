// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_strength_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordStrengthModel _$PasswordStrengthModelFromJson(
        Map<String, dynamic> json) =>
    PasswordStrengthModel(
      requireDigit: json['requireDigit'] as bool? ?? true,
      requireLowercase: json['requireLowercase'] as bool? ?? true,
      requireNonAlphanumeric: json['requireNonAlphanumeric'] as bool? ?? true,
      requireUppercase: json['requireUppercase'] as bool? ?? true,
      requiredLength: (json['requiredLength'] as num?)?.toInt() ?? 8,
    );

Map<String, dynamic> _$PasswordStrengthModelToJson(
        PasswordStrengthModel instance) =>
    <String, dynamic>{
      'requireDigit': instance.requireDigit,
      'requireLowercase': instance.requireLowercase,
      'requireNonAlphanumeric': instance.requireNonAlphanumeric,
      'requireUppercase': instance.requireUppercase,
      'requiredLength': instance.requiredLength,
    };
