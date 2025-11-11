// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResultModel _$RegisterResultModelFromJson(Map<String, dynamic> json) =>
    RegisterResultModel(
      tenantId: (json['tenantId'] as num).toInt(),
      tenancyName: json['tenancyName'] as String,
      name: json['name'] as String,
      userName: json['userName'] as String,
      emailAddress: json['emailAddress'] as String,
      isTenantActive: json['isTenantActive'] as bool? ?? true,
      isActive: json['isActive'] as bool? ?? true,
      isEmailConfirmationRequired:
          json['isEmailConfirmationRequired'] as bool? ?? true,
      captchaResult: json['captchaResult'] as String?,
    );

Map<String, dynamic> _$RegisterResultModelToJson(
        RegisterResultModel instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'tenancyName': instance.tenancyName,
      'name': instance.name,
      'userName': instance.userName,
      'emailAddress': instance.emailAddress,
      'isTenantActive': instance.isTenantActive,
      'isActive': instance.isActive,
      'isEmailConfirmationRequired': instance.isEmailConfirmationRequired,
      'captchaResult': instance.captchaResult,
    };
