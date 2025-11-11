// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_meta_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureMetadataModel _$FeatureMetadataModelFromJson(
        Map<String, dynamic> json) =>
    FeatureMetadataModel(
      dataType: (json['dataType'] as num).toInt(),
      isVisibleOnPricingTable: json['isVisibleOnPricingTable'] as bool,
      isVisibleOnTenantSubscription:
          json['isVisibleOnTenantSubscription'] as bool,
    );

Map<String, dynamic> _$FeatureMetadataModelToJson(
        FeatureMetadataModel instance) =>
    <String, dynamic>{
      'dataType': instance.dataType,
      'isVisibleOnPricingTable': instance.isVisibleOnPricingTable,
      'isVisibleOnTenantSubscription': instance.isVisibleOnTenantSubscription,
    };
