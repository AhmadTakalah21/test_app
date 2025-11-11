import 'dart:convert';
import 'package:appointments_app/features/auth/model/editions_with_features_model/editions_with_features_model.dart';
import 'package:appointments_app/features/auth/model/feature_model/feature_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'editions_for_select_model.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class EditionsForSelectModel {
  const EditionsForSelectModel({
    this.allFeatures = const [],
    this.editionsWithFeatures = const [],
    this.tenantEditionId,
  });

  @JsonKey(name: 'allFeatures')
  final List<FeatureModel> allFeatures;

  @JsonKey(name: 'editionsWithFeatures')
  final List<EditionWithFeaturesModel> editionsWithFeatures;

  final int? tenantEditionId;

  factory EditionsForSelectModel.fromJson(Map<String, dynamic> json) =>
      _$EditionsForSelectModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditionsForSelectModelToJson(this);

  factory EditionsForSelectModel.fromString(String jsonString) =>
      EditionsForSelectModel.fromJson(json.decode(jsonString));

  @override
  String toString() => jsonEncode(toJson());
}
