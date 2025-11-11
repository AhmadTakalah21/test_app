import 'package:appointments_app/features/auth/model/validator_model/validator_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'input_type_model.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class InputTypeModel {
  const InputTypeModel({
    required this.name,
    required this.attributes,
    required this.validator,
    this.itemSource,
  });

  final String name;
  final Map<String, dynamic> attributes;
  final ValidatorModel validator;
  final dynamic itemSource;

  factory InputTypeModel.fromJson(Map<String, dynamic> json) =>
      _$InputTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$InputTypeModelToJson(this);
}