import 'dart:convert';

import 'package:appointments_app/features/auth/model/app_info_model/app_info_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'login_info_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class LoginInfoResultModel {
  const LoginInfoResultModel({
    this.user,
    this.tenant,
    required this.application,
  });

  final dynamic user;
  final dynamic tenant;
  final AppInfoModel application;

  factory LoginInfoResultModel.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoResultModelToJson(this);

  factory LoginInfoResultModel.fromString(String jsonString) =>
      LoginInfoResultModel.fromJson(json.decode(jsonString));

  @override
  String toString() => jsonEncode(toJson());
}
