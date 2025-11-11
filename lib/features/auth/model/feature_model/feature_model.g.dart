// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) => FeatureModel(
      name: json['name'] as String,
      parentName: json['parentName'] as String?,
      displayName: json['displayName'] as String,
      description: json['description'] as String?,
      defaultValue: json['defaultValue'] as String?,
      metadata: FeatureMetadataModel.fromJson(
          json['metadata'] as Map<String, dynamic>),
      inputType:
          InputTypeModel.fromJson(json['inputType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeatureModelToJson(FeatureModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'parentName': instance.parentName,
      'displayName': instance.displayName,
      'description': instance.description,
      'defaultValue': instance.defaultValue,
      'metadata': instance.metadata.toJson(),
      'inputType': instance.inputType.toJson(),
    };
