// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expiring_edition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpiringEditionModel _$ExpiringEditionModelFromJson(
        Map<String, dynamic> json) =>
    ExpiringEditionModel(
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ExpiringEditionModelToJson(
        ExpiringEditionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'id': instance.id,
    };
