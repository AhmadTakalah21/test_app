import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'expiring_edition_model.g.dart';

@JsonSerializable()
@immutable
class ExpiringEditionModel {
  const ExpiringEditionModel({
    required this.name,
    required this.displayName,
    required this.id,
  });

  final String name;
  final String displayName;
  final int id;

  factory ExpiringEditionModel.fromJson(Map<String, dynamic> json) =>
      _$ExpiringEditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpiringEditionModelToJson(this);
}