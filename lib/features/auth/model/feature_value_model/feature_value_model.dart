import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'feature_value_model.g.dart';

@JsonSerializable()
@immutable
class FeatureValueModel {
  const FeatureValueModel({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  factory FeatureValueModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureValueModelToJson(this);
}