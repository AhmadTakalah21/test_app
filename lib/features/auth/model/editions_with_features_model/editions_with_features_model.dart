import 'package:appointments_app/features/auth/model/edition_model/edition_model.dart';
import 'package:appointments_app/features/auth/model/feature_value_model/feature_value_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'editions_with_features_model.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class EditionWithFeaturesModel {
  const EditionWithFeaturesModel({
    required this.edition,
    required this.featureValues,
  });

  final EditionModel edition;
  final List<FeatureValueModel> featureValues;

  factory EditionWithFeaturesModel.fromJson(Map<String, dynamic> json) =>
      _$EditionWithFeaturesModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditionWithFeaturesModelToJson(this);
}