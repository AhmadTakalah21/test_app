import 'dart:convert';
import 'package:appointments_app/global/utils/json_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tenant_availability_model.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class TenantAvailabilityModel {
  const TenantAvailabilityModel({
    required this.state,
    this.tenantId,
    this.serverRootAddress,
    this.apiUrl,
    this.dnsUrl,
    this.isAvailable = false,
  });

  final int state;
  final int? tenantId;
  final String? serverRootAddress;
  final String? apiUrl;
  final String? dnsUrl;

  @JsonKey(
    fromJson: JsonUtils.setIsTenantAvailable,
    readValue: JsonUtils.readValue,
    includeToJson: false,
    includeFromJson: false,
  )
  final bool isAvailable;

  factory TenantAvailabilityModel.fromJson(Map<String, dynamic> json) =>
      _$TenantAvailabilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$TenantAvailabilityModelToJson(this);

  factory TenantAvailabilityModel.fromString(String jsonString) =>
      TenantAvailabilityModel.fromJson(json.decode(jsonString));

  @override
  String toString() => jsonEncode(toJson());
}
