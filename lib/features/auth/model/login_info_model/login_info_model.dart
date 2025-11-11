// import 'dart:convert';
// import 'package:appointments_app/features/auth/model/login_info_result_model/login_info_result_model.dart';
// import 'package:flutter/material.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'login_info_model.g.dart';

// @JsonSerializable(explicitToJson: true)
// @immutable
// class LoginInfoModel {
//   const LoginInfoModel({
//     required this.result,
//     this.targetUrl,
//     required this.success,
//     this.error,
//     required this.unAuthorizedRequest,
//     required this.abp,
//   });

//   final LoginInfoResultModel result;
//   final String? targetUrl;
//   final bool success;
//   final String? error;

//   @JsonKey(name: 'unAuthorizedRequest')
//   final bool unAuthorizedRequest;

//   @JsonKey(name: '__abp')
//   final bool abp;

//   factory LoginInfoModel.fromJson(Map<String, dynamic> json) =>
//       _$LoginInfoModelFromJson(json);

//   Map<String, dynamic> toJson() => _$LoginInfoModelToJson(this);

//   factory LoginInfoModel.fromString(String jsonString) =>
//       LoginInfoModel.fromJson(json.decode(jsonString));

//   @override
//   String toString() => jsonEncode(toJson());
// }