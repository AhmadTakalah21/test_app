import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feature_meta_data_model.g.dart';

@JsonSerializable()
@immutable
class FeatureMetadataModel {
  const FeatureMetadataModel({
    required this.dataType,
    required this.isVisibleOnPricingTable,
    required this.isVisibleOnTenantSubscription,
  });

  final int dataType;
  final bool isVisibleOnPricingTable;
  final bool isVisibleOnTenantSubscription;

  factory FeatureMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureMetadataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureMetadataModelToJson(this);
}
