// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editions_for_select_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditionsForSelectModel _$EditionsForSelectModelFromJson(
        Map<String, dynamic> json) =>
    EditionsForSelectModel(
      allFeatures: (json['allFeatures'] as List<dynamic>?)
              ?.map((e) => FeatureModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      editionsWithFeatures: (json['editionsWithFeatures'] as List<dynamic>?)
              ?.map((e) =>
                  EditionWithFeaturesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tenantEditionId: (json['tenantEditionId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EditionsForSelectModelToJson(
        EditionsForSelectModel instance) =>
    <String, dynamic>{
      'allFeatures': instance.allFeatures.map((e) => e.toJson()).toList(),
      'editionsWithFeatures':
          instance.editionsWithFeatures.map((e) => e.toJson()).toList(),
      'tenantEditionId': instance.tenantEditionId,
    };
