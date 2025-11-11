import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'password_strength_model.g.dart';

@JsonSerializable()
@immutable
class PasswordStrengthModel {
  const PasswordStrengthModel({
    this.requireDigit = true,
    this.requireLowercase = true,
    this.requireNonAlphanumeric = true,
    this.requireUppercase = true,
    this.requiredLength = 8,
  });
  final bool requireDigit;
  final bool requireLowercase;
  final bool requireNonAlphanumeric;
  final bool requireUppercase;
  final int requiredLength;

  factory PasswordStrengthModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordStrengthModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordStrengthModelToJson(this);
}
