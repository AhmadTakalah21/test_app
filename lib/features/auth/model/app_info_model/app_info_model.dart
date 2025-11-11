import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'app_info_model.g.dart';

@JsonSerializable()
@immutable
class AppInfoModel {
  const AppInfoModel({
    required this.version,
    required this.releaseDate,
    required this.currency,
    required this.currencySign,
    required this.userDelegationIsEnabled,
    required this.features,
    required this.compatibleMobileClientVersion,
    required this.compatibleWebClientVersion,
  });

  final String version;
  final DateTime releaseDate;
  final String currency;
  final String currencySign;
  final bool userDelegationIsEnabled;
  final Map<String, dynamic> features;
  final String compatibleMobileClientVersion;
  final String compatibleWebClientVersion;

  factory AppInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AppInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppInfoModelToJson(this);

  factory AppInfoModel.fromString(String jsonString) =>
      AppInfoModel.fromJson(json.decode(jsonString));

  @override
  String toString() => jsonEncode(toJson());
}
