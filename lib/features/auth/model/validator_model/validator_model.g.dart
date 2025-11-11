// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidatorModel _$ValidatorModelFromJson(Map<String, dynamic> json) =>
    ValidatorModel(
      minValue: (json['minValue'] as num?)?.toInt(),
      maxValue: (json['maxValue'] as num?)?.toInt(),
      name: json['name'] as String,
      attributes: json['attributes'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ValidatorModelToJson(ValidatorModel instance) =>
    <String, dynamic>{
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'name': instance.name,
      'attributes': instance.attributes,
    };
