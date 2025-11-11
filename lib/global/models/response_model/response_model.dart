import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
@immutable
class ResponseModel<T> {
  const ResponseModel({
    required this.result,
    this.targetUrl,
    required this.success,
    this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  final T result;
  final String? targetUrl;
  final bool success;
  final String? error;

  @JsonKey(name: 'unAuthorizedRequest')
  final bool unAuthorizedRequest;

  @JsonKey(name: '__abp')
  final bool abp;

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ResponseModelToJson(this, toJsonT);

  factory ResponseModel.fromString(
    String jsonString,
    T Function(Object? json) fromJsonT,
  ) =>
      ResponseModel.fromJson(json.decode(jsonString), fromJsonT);

  @override
  String toString() => jsonEncode(toJson((value) => value));
}
