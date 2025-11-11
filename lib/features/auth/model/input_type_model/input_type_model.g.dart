// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputTypeModel _$InputTypeModelFromJson(Map<String, dynamic> json) =>
    InputTypeModel(
      name: json['name'] as String,
      attributes: json['attributes'] as Map<String, dynamic>,
      validator:
          ValidatorModel.fromJson(json['validator'] as Map<String, dynamic>),
      itemSource: json['itemSource'],
    );

Map<String, dynamic> _$InputTypeModelToJson(InputTypeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'attributes': instance.attributes,
      'validator': instance.validator.toJson(),
      'itemSource': instance.itemSource,
    };
