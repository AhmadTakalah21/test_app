// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) => SignInModel(
      tenantName: json['tenancyName'] as String?,
      userNameOrEmailAddress: json['userNameOrEmailAddress'] as String?,
      password: json['password'] as String?,
      rememberClient: json['rememberClient'] as bool? ?? false,
    );

Map<String, dynamic> _$SignInModelToJson(SignInModel instance) =>
    <String, dynamic>{
      'rememberClient': instance.rememberClient,
      'tenancyName': instance.tenantName,
      'userNameOrEmailAddress': instance.userNameOrEmailAddress,
      'password': instance.password,
    };
