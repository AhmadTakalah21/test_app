import 'package:appointments_app/features/auth/model/editions_for_select_model/editions_for_select_model.dart';
import 'package:appointments_app/features/auth/model/login_info_result_model/login_info_result_model.dart';
import 'package:appointments_app/features/auth/model/password_strength_model/password_strength_model.dart';
import 'package:appointments_app/features/auth/model/register_model/register_model.dart';
import 'package:appointments_app/features/auth/model/register_result_model/register_result_model.dart';
import 'package:appointments_app/features/auth/model/tenant_availability_model/tenant_availability_model.dart';
import 'package:appointments_app/global/dio/dio_client.dart';
import 'package:appointments_app/global/models/response_model/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'auth_service_imp.dart';

class AuthResultModel {
  AuthResultModel({
    required this.accessToken,
    required this.expireInSeconds,
    this.encryptedAccessToken,
    this.userId,
  });

  final String accessToken;
  final int expireInSeconds;
  final String? encryptedAccessToken;
  final int? userId;

  factory AuthResultModel.fromJson(Map<String, dynamic> json) {
    return AuthResultModel(
      accessToken: json['accessToken'] as String,
      expireInSeconds: (json['expireInSeconds'] as num).toInt(),
      encryptedAccessToken: json['encryptedAccessToken'] as String?,
      userId: json['userId'] as int?,
    );
  }
}

abstract class AuthService {
  Future<ResponseModel<LoginInfoResultModel>> getCurrentLoginInfo();
  Future<ResponseModel<EditionsForSelectModel>> getEditionsForSelect();
  Future<ResponseModel<PasswordStrengthModel>> getPasswordComplexity();
  Future<ResponseModel<TenantAvailabilityModel>> checkTenantAvailability(String name);

  Future<ResponseModel<RegisterResultModel>> register(
      RegisterModel model, {
        String? timeZone,
      });

  Future<ResponseModel<AuthResultModel>> authenticate({
    required String tenantName,
    required String emailOrUserName,
    required String password,
    required String ianaTimeZone,
    bool rememberClient = false,
  });
}
