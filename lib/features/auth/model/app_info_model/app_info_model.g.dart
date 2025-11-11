// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppInfoModel _$AppInfoModelFromJson(Map<String, dynamic> json) => AppInfoModel(
      version: json['version'] as String,
      releaseDate: DateTime.parse(json['releaseDate'] as String),
      currency: json['currency'] as String,
      currencySign: json['currencySign'] as String,
      userDelegationIsEnabled: json['userDelegationIsEnabled'] as bool,
      features: json['features'] as Map<String, dynamic>,
      compatibleMobileClientVersion:
          json['compatibleMobileClientVersion'] as String,
      compatibleWebClientVersion: json['compatibleWebClientVersion'] as String,
    );

Map<String, dynamic> _$AppInfoModelToJson(AppInfoModel instance) =>
    <String, dynamic>{
      'version': instance.version,
      'releaseDate': instance.releaseDate.toIso8601String(),
      'currency': instance.currency,
      'currencySign': instance.currencySign,
      'userDelegationIsEnabled': instance.userDelegationIsEnabled,
      'features': instance.features,
      'compatibleMobileClientVersion': instance.compatibleMobileClientVersion,
      'compatibleWebClientVersion': instance.compatibleWebClientVersion,
    };
