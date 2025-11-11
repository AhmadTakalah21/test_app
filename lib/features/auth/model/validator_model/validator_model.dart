import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'validator_model.g.dart';

@JsonSerializable()
@immutable
class ValidatorModel {
  const ValidatorModel({
    this.minValue,
    this.maxValue,
    required this.name,
    required this.attributes,
  });

  final int? minValue;
  final int? maxValue;
  final String name;
  final Map<String, dynamic> attributes;

  factory ValidatorModel.fromJson(Map<String, dynamic> json) =>
      _$ValidatorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValidatorModelToJson(this);
}