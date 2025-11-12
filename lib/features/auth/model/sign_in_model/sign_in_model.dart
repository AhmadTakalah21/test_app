import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
@immutable
class SignInModel {
  const SignInModel({
    String? tenantName,
    String? userNameOrEmailAddress,
    String? password,
    this.rememberClient = false,
  }) : _tenantName = tenantName,
       _userNameOrEmailAddress = userNameOrEmailAddress,
       _password = password;

  factory SignInModel.fromString(String str) =>
      SignInModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  final String? _tenantName;
  final String? _userNameOrEmailAddress;
  final String? _password;

  @JsonKey(name: 'rememberClient')
  final bool rememberClient;

  @JsonKey(name: 'tenancyName')
  String get tenantName => _tenantName ?? '';

  @JsonKey(name: 'userNameOrEmailAddress')
  String get userNameOrEmailAddress => _userNameOrEmailAddress ?? '';

  @JsonKey(name: 'password')
  String get password => _password ?? '';

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);

  SignInModel copyWith({
    String? Function()? tenantName,
    String? Function()? userNameOrEmailAddress,
    String? Function()? password,
    bool? rememberClient,
  }) {
    return SignInModel(
      tenantName: tenantName != null ? tenantName() : _tenantName,
      userNameOrEmailAddress: userNameOrEmailAddress != null
          ? userNameOrEmailAddress()
          : _userNameOrEmailAddress,
      password: password != null ? password() : _password,
      rememberClient: rememberClient ?? this.rememberClient,
    );
  }

  @override
  String toString() => jsonEncode(toJson());
}
