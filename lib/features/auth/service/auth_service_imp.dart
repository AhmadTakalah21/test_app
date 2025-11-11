part of 'auth_service.dart';

@Injectable(as: AuthService)
class AuthServiceImp implements AuthService {
  final dio = DioClient();

  @override
  Future<ResponseModel<LoginInfoResultModel>> getCurrentLoginInfo() async {
    try {
      final endpoint = "/services/app/Session/GetCurrentLoginInformations";
      final response = await dio.get(endpoint);
      final data = response.data as Map<String, dynamic>;
      fromJsonT(json) =>
          LoginInfoResultModel.fromJson(json as Map<String, dynamic>);
      return ResponseModel.fromJson(data, fromJsonT);
    } catch (e, stackTrace) {
      if (kDebugMode) print("stackTrace of curr info login : $stackTrace");
      rethrow;
    }
  }

  @override
  Future<ResponseModel<EditionsForSelectModel>> getEditionsForSelect() async {
    try {
      final endpoint = "/services/app/TenantRegistration/GetEditionsForSelect";
      final response = await dio.get(endpoint);
      final data = response.data as Map<String, dynamic>;
      fromJsonT(json) =>
          EditionsForSelectModel.fromJson(json as Map<String, dynamic>);
      return ResponseModel.fromJson(data, fromJsonT);
    } catch (e, stackTrace) {
      if (kDebugMode) print("stackTrace of getEditionsForSelect : $stackTrace");
      rethrow;
    }
  }

  @override
  Future<ResponseModel<PasswordStrengthModel>> getPasswordComplexity() async {
    try {
      final endpoint = "/services/app/Profile/GetPasswordComplexitySetting";
      final response = await dio.get(endpoint);
      final data = response.data as Map<String, dynamic>;
      fromJsonT(json) => PasswordStrengthModel.fromJson(
        json["setting"] as Map<String, dynamic>,
      );
      return ResponseModel.fromJson(data, fromJsonT);
    } catch (e, stackTrace) {
      if (kDebugMode) print("stackTrace of getPassComplexity : $stackTrace");
      rethrow;
    }
  }

  @override
  Future<ResponseModel<TenantAvailabilityModel>> checkTenantAvailability(
    String name,
  ) async {
    try {
      final endpoint = "/services/app/Account/IsTenantAvailable";
      final data = {"tenancyName": name};
      final response = await dio.post(endpoint, data: data);
      final json = response.data as Map<String, dynamic>;
      fromJsonT(json) =>
          TenantAvailabilityModel.fromJson(json as Map<String, dynamic>);
      return ResponseModel.fromJson(json, fromJsonT);
    } catch (e, stackTrace) {
      if (kDebugMode) print("stackTrace of TenantAvailability : $stackTrace");
      rethrow;
    }
  }

  @override
  Future<ResponseModel<RegisterResultModel>> register(
    RegisterModel model, {
    String? timeZone,
  }) async {
    try {
      final endpoint = "/services/app/TenantRegistration/RegisterTenant";
      final data = model.toJson();
      final queries = {if (timeZone != null) "timeZone": timeZone};
      final response = await dio.post(endpoint, data: data, queries: queries);
      final json = response.data as Map<String, dynamic>;
      fromJsonT(json) =>
          RegisterResultModel.fromJson(json as Map<String, dynamic>);
      return ResponseModel.fromJson(json, fromJsonT);
    } catch (e, stackTrace) {
      if (kDebugMode) print("stackTrace of getPassComplexity : $stackTrace");
      rethrow;
    }
  }

  // @override
  // Future<SignInModel> signIn(String email, String password, String? fcmToken, {String? code}) async {
  //   try {
  //     final data = {
  //       'email': email.trim(),
  //       'password': password,
  //       'fcm_token': fcmToken,
  //       if (code != null && code.isNotEmpty) 'code': code,
  //     };
  //     final response = await dio.post('/v1/auth/login', data: data);
  //     final body = response.data['data'] as Map<String, dynamic>;
  //     return SignInModel.fromJson(body);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<SignInModel> signUp(PostSignUpModel postSignUpModel) async {
  //   try {
  //     final response = await dio.post('/v1/auth/register', data: postSignUpModel.toJson());
  //     final body = response.data['data'] as Map<String, dynamic>;
  //     return SignInModel.fromJson(body);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<CustomerModel> addInfo(AddInfoModel addInfoModel) async {
  //   const endpoint = '/v1/users/information';
  //   try {
  //     final response = await dio.post(endpoint, data: addInfoModel.toJson());
  //     final customer = response.data['data'] as Map<String, dynamic>;
  //     return CustomerModel.fromJson(customer);
  //   } catch (e, stackTrace) {
  //     if (kDebugMode) print(stackTrace);
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> logout() async {
  //   try {
  //     await dio.post('/v1/auth/logout');
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> requestPasswordReset({required String email}) async {
  //   try {
  //     final data = {'email': email.trim()};
  //     await dio.post('/v1/auth/password/forgot', data: data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> verifyPasswordResetCode({required String email, required String code}) async {
  //   try {
  //     final data = {
  //       'email': email.trim(),
  //       'code': code.trim(),
  //     };
  //     await dio.post('/v1/auth/password/verify', data: data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> resetPassword({
  //   required String email,
  //   required String code,
  //   required String password,
  //   required String passwordConfirmation,
  // }) async {
  //   try {
  //     final data = {
  //       'email': email.trim(),
  //       'code': code.trim(),
  //       'password': password,
  //       'password_confirmation': passwordConfirmation,
  //     };
  //     await dio.post('/v1/auth/password/reset', data: data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
