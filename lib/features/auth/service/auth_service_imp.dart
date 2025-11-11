part of 'auth_service.dart';

@Injectable(as: AuthService)
class AuthServiceImp implements AuthService {
  final dio = DioClient();

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

