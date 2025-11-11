// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_availability_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenantAvailabilityModel _$TenantAvailabilityModelFromJson(
        Map<String, dynamic> json) =>
    TenantAvailabilityModel(
      state: (json['state'] as num).toInt(),
      tenantId: (json['tenantId'] as num?)?.toInt(),
      serverRootAddress: json['serverRootAddress'] as String?,
      apiUrl: json['apiUrl'] as String?,
      dnsUrl: json['dnsUrl'] as String?,
    );

Map<String, dynamic> _$TenantAvailabilityModelToJson(
        TenantAvailabilityModel instance) =>
    <String, dynamic>{
      'state': instance.state,
      'tenantId': instance.tenantId,
      'serverRootAddress': instance.serverRootAddress,
      'apiUrl': instance.apiUrl,
      'dnsUrl': instance.dnsUrl,
    };
