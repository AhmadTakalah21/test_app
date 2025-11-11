import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'register_model.g.dart';

@JsonSerializable()
@immutable
class RegisterModel {
  const RegisterModel({
    String? adminEmailAddress,
    String? adminFirstName,
    String? adminLastName,
    String? adminPassword,
    String? captchaResponse,
    int? editionId,
    String? name,
    String? tenancyName,
  })  : _adminEmailAddress = adminEmailAddress,
        _adminFirstName = adminFirstName,
        _adminLastName = adminLastName,
        _adminPassword = adminPassword,
        _captchaResponse = captchaResponse,
        _editionId = editionId,
        _name = name,
        _tenancyName = tenancyName;

  factory RegisterModel.fromJsonStr(String str) =>
      RegisterModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  final String? _adminEmailAddress;
  final String? _adminFirstName;
  final String? _adminLastName;
  final String? _adminPassword;
  final String? _captchaResponse;
  final int? _editionId;
  final String? _name;
  final String? _tenancyName;

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  RegisterModel copyWith({
    String? Function()? adminEmailAddress,
    String? Function()? adminFirstName,
    String? Function()? adminLastName,
    String? Function()? adminPassword,
    String? Function()? captchaResponse,
    int? Function()? editionId,
    String? Function()? name,
    String? Function()? tenancyName,
  }) {
    return RegisterModel(
      adminEmailAddress:
          adminEmailAddress != null ? adminEmailAddress() : _adminEmailAddress,
      adminFirstName:
          adminFirstName != null ? adminFirstName() : _adminFirstName,
      adminLastName: adminLastName != null ? adminLastName() : _adminLastName,
      adminPassword: adminPassword != null ? adminPassword() : _adminPassword,
      captchaResponse:
          captchaResponse != null ? captchaResponse() : _captchaResponse,
      editionId: editionId != null ? editionId() : _editionId,
      name: name != null ? name() : _name,
      tenancyName: tenancyName != null ? tenancyName() : _tenancyName,
    );
  }

  @JsonKey(name: "adminEmailAddress")
  String get adminEmailAddress =>
      _adminEmailAddress ?? (throw 'email_empty'.tr());

  @JsonKey(name: "adminFirstName")
  String get adminFirstName =>
      _adminFirstName ?? (throw 'first_name_empty'.tr());

  @JsonKey(name: "adminLastName")
  String get adminLastName => _adminLastName ?? (throw 'last_name_empty'.tr());

  @JsonKey(name: "adminPassword")
  String get adminPassword =>
      _adminPassword ?? (throw 'password_required'.tr());

  @JsonKey(name: "captchaResponse")
  String? get captchaResponse => _captchaResponse;

  @JsonKey(name: "editionId")
  int get editionId => _editionId ?? (throw 'edition_id_required'.tr());

  @JsonKey(name: "name")
  String get name => _name ?? (throw 'name_required'.tr());

  @JsonKey(name: "tenancyName")
  String get tenancyName =>
      _tenancyName ?? (throw 'tenancy_name_required'.tr());

  @override
  String toString() => jsonEncode(toJson());
}
