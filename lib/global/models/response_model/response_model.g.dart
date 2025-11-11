// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel<T> _$ResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResponseModel<T>(
      result: fromJsonT(json['result']),
      targetUrl: json['targetUrl'] as String?,
      success: json['success'] as bool,
      error: json['error'] as String?,
      unAuthorizedRequest: json['unAuthorizedRequest'] as bool,
      abp: json['__abp'] as bool,
    );

Map<String, dynamic> _$ResponseModelToJson<T>(
  ResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'result': toJsonT(instance.result),
      'targetUrl': instance.targetUrl,
      'success': instance.success,
      'error': instance.error,
      'unAuthorizedRequest': instance.unAuthorizedRequest,
      '__abp': instance.abp,
    };
