import 'package:appointments_app/features/auth/model/feature_meta_data_model/feature_meta_data_model.dart';
import 'package:appointments_app/features/auth/model/input_type_model/input_type_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feature_model.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class FeatureModel {
  const FeatureModel({
    required this.name,
    this.parentName,
    required this.displayName,
    this.description,
    this.defaultValue,
    required this.metadata,
    required this.inputType,
  });

  final String name;
  final String? parentName;
  final String displayName;
  final String? description;
  final String? defaultValue;
  final FeatureMetadataModel metadata;
  final InputTypeModel inputType;

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureModelToJson(this);
}