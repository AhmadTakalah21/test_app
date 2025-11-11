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

abstract class AuthService {
  Future<ResponseModel<LoginInfoResultModel>> getCurrentLoginInfo();
  Future<ResponseModel<EditionsForSelectModel>> getEditionsForSelect();
  Future<ResponseModel<PasswordStrengthModel>> getPasswordComplexity();
  Future<ResponseModel<TenantAvailabilityModel>> checkTenantAvailability(
    String name,
  );
  Future<ResponseModel<RegisterResultModel>> register(
    RegisterModel model, {
    String? timeZone,
  });
  // Future<SignInModel> signIn(String email, String password, String? fcmToken,
  //     {String? code});
  // Future<SignInModel> signUp(PostSignUpModel postSignUpModel);
  // Future<void> logout();
  // Future<void> requestPasswordReset({required String email});
  // Future<void> verifyPasswordResetCode({required String email, required String code});
  // Future<void> resetPassword({
  //   required String email,
  //   required String code,
  //   required String password,
  //   required String passwordConfirmation,
  // });
}
