// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) => SignInModel(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      token: json['token'] as String?,
      name: json['name'] as String,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$SignInModelToJson(SignInModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'token': instance.token,
      'name': instance.name,
      'phone': instance.phone,
    };
