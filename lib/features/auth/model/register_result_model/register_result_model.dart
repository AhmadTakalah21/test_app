import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class RegisterResultModel {
  const RegisterResultModel({
    required this.tenantId,
    required this.tenancyName,
    required this.name,
    required this.userName,
    required this.emailAddress,
    this.isTenantActive = true,
    this.isActive = true,
    this.isEmailConfirmationRequired = true,
    this.captchaResult,
  });

  final int tenantId;
  final String tenancyName;
  final String name;
  final String userName;
  final String emailAddress;
  final bool isTenantActive;
  final bool isActive;
  final bool isEmailConfirmationRequired;
  final String? captchaResult;

  factory RegisterResultModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResultModelToJson(this);

  factory RegisterResultModel.fromString(String jsonString) =>
      RegisterResultModel.fromJson(json.decode(jsonString));

  @override
  String toString() => jsonEncode(toJson());
}
