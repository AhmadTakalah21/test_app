part of 'auth_service.dart';

@Injectable(as: AuthService)
class AuthServiceImp implements AuthService {
  final dio = DioClient();

  @override
  Future<ResponseModel<LoginInfoResultModel>> getCurrentLoginInfo() async {
    final endpoint = "/services/app/Session/GetCurrentLoginInformations";
    final response = await dio.get(endpoint);
    final data = response.data as Map<String, dynamic>;
    fromJsonT(json) => LoginInfoResultModel.fromJson(json as Map<String, dynamic>);
    return ResponseModel.fromJson(data, fromJsonT);
  }

  @override
  Future<ResponseModel<EditionsForSelectModel>> getEditionsForSelect() async {
    final endpoint = "/services/app/TenantRegistration/GetEditionsForSelect";
    final response = await dio.get(endpoint);
    final data = response.data as Map<String, dynamic>;
    fromJsonT(json) => EditionsForSelectModel.fromJson(json as Map<String, dynamic>);
    return ResponseModel.fromJson(data, fromJsonT);
  }

  @override
  Future<ResponseModel<PasswordStrengthModel>> getPasswordComplexity() async {
    final endpoint = "/services/app/Profile/GetPasswordComplexitySetting";
    final response = await dio.get(endpoint);
    final data = response.data as Map<String, dynamic>;
    fromJsonT(json) => PasswordStrengthModel.fromJson(
      (json["setting"] as Map<String, dynamic>),
    );
    return ResponseModel.fromJson(data, fromJsonT);
  }

  @override
  Future<ResponseModel<TenantAvailabilityModel>> checkTenantAvailability(
      String name,
      ) async {
    final endpoint = "/services/app/Account/IsTenantAvailable";
    final body = {"tenancyName": name.trim().toLowerCase()};
    final response = await dio.post(endpoint, data: body);
    final map = response.data as Map<String, dynamic>;
    fromJsonT(json) => TenantAvailabilityModel.fromJson(json as Map<String, dynamic>);
    final result = ResponseModel.fromJson(map, fromJsonT);



    return result;
  }

  @override
  Future<ResponseModel<RegisterResultModel>> register(
      RegisterModel model, {
        String? timeZone,
      }) async {
    const endpoint = "/services/app/TenantRegistration/RegisterTenant";

    final normalized = model.tenancyName.trim().toLowerCase();
    if (normalized.isNotEmpty) {
      model = model.copyWith(tenancyName: () => normalized);
    }

    await dio.setTenantId(null);

    final Map<String, dynamic>? queries =
    (timeZone != null && timeZone.isNotEmpty) ? {"timeZone": timeZone} : null;

    final response = await dio.post(
      endpoint,
      data: model.toJson(),
      queries: queries,
    );

    final json = response.data as Map<String, dynamic>;
    fromJsonT(obj) => RegisterResultModel.fromJson(obj as Map<String, dynamic>);
    final result = ResponseModel.fromJson(json, fromJsonT);


    return result;
  }
@override
  Future<ResponseModel<AuthResultModel>> authenticate({
    required String tenantName,
    required String emailOrUserName,
    required String password,
    required String ianaTimeZone,
    bool rememberClient = false,
  }) async {
    try {
      const endpoint = "/TokenAuth/Authenticate";

      final payload = <String, dynamic>{
        "tenantName": tenantName.trim(),
        "userNameOrEmailAddress": emailOrUserName.trim(),
        "password": password,
        "rememberClient": rememberClient,
        "returnUrl": null,
        "singleSignIn": false,
        "ianaTimeZone": ianaTimeZone,
      };

      final response = await dio.post(endpoint, data: payload);
      final json = response.data as Map<String, dynamic>;

      final result = ResponseModel.fromJson(
        json,
        (obj) => AuthResultModel.fromJson(obj as Map<String, dynamic>),
      );

      await dio.setAuthToken(result.result.accessToken);
      await dio.setIanaTimeZone(ianaTimeZone);

      return result;
    } catch (e, st) {
      if (kDebugMode) print("authenticate error: $e\n$st");
      rethrow;
    }
  }
}
