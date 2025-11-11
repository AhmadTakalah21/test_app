import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
@immutable
class SignInModel {
  const SignInModel({
    required this.id,
    required this.email,
    this.token,
    required this.name,
    this.phone,
  });

  final int id;
  final String email;
  final String? token;
  final String name;
  final String? phone;

  factory SignInModel.fromString(String str) =>
      SignInModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);
}
