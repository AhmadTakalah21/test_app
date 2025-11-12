import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appointments_app/features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:appointments_app/global/di/di.dart';
import 'package:appointments_app/global/utils/logger.dart';

class AppInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept'] = 'application/json';

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final tenantId = prefs.getInt("abp_tenant_id");
    final langCode = prefs.getString("lang_code");
    final ianaTz = prefs.getString("iana_tz");

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      if (kDebugMode) debugPrint('Bearer $token');
    }

    if (tenantId != null) {
      options.headers['Abp.TenantId'] = tenantId.toString();
    }

    if (langCode != null && langCode.isNotEmpty) {
      options.headers['Accept-Language'] = langCode;
    }

    if (ianaTz != null && ianaTz.isNotEmpty) {
      options.headers['IanaTimeZone'] = ianaTz;
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.f(
      'Message: ${err.message}\n'
      'Error: ${err.error}\n'
      'Status code: ${err.response?.statusCode}\n'
      'Type: ${err.type}\n'
      'Response: ${err.response?.data}',
    );

    if (err.response?.statusCode == 401) {
      get<AuthManagerBloc>().add(SignOutRequested());
      throw UnauthorizedException(err.requestOptions);
    }

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      throw DeadlineExceededException(err.requestOptions);
    }

    if (err.response?.statusCode == 400) {
      throw BadRequestException(
        requestOptions: err.requestOptions,
        response: err.response,
        message: err.message,
      );
    }

    throw CustomDioException(
      response: err.response,
      error: err.error,
      requestOptions: err.requestOptions,
      type: err.type,
      message: err.message,
    );
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions requestOptions)
    : super(requestOptions: requestOptions);

  @override
  String toString() => "unauthorized".tr();
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions requestOptions)
    : super(requestOptions: requestOptions);

  @override
  String toString() => "connection_out".tr();
}

class BadRequestException extends DioException {
  BadRequestException({
    required super.requestOptions,
    required super.response,
    super.message,
  });

  @override
  String toString() {
    return response?.data["message"] ?? "invalid_request".tr();
  }
}

class CustomDioException extends DioException {
  CustomDioException({
    required super.requestOptions,
    required super.response,
    super.error,
    super.type,
    super.message,
  });

  @override
  String toString() {
    try {
      return response?.data?["message"]?.toString() ??
          response?.data ??
          error?.toString() ??
          "something_went_wrong".tr();
    } catch (_) {
      return "something_went_wrong".tr();
    }
  }
}
