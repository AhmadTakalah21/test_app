// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfoResultModel _$LoginInfoResultModelFromJson(
        Map<String, dynamic> json) =>
    LoginInfoResultModel(
      user: json['user'],
      tenant: json['tenant'],
      application:
          AppInfoModel.fromJson(json['application'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginInfoResultModelToJson(
        LoginInfoResultModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tenant': instance.tenant,
      'application': instance.application.toJson(),
    };
