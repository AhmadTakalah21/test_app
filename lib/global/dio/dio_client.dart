import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:appointments_app/global/dio/app_interceptor.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "https://api.workiom.club";
const apiUrl = '$baseUrl/api/';

@singleton
class DioClient {
  factory DioClient() => _instance;
  DioClient._() {
    final baseOptions = BaseOptions(
      baseUrl: apiUrl,
      receiveTimeout: AppConstants.duration25s,
      connectTimeout: AppConstants.duration25s,
      sendTimeout: AppConstants.duration25s,
    );

    _dio = Dio(baseOptions);
    _dio.interceptors.add(AppInterceptor());
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        maxWidth: 98,
        compact: true,
        logPrint: dioPrint,
      ),
    );
  }

  static final DioClient _instance = DioClient._();
  late final Dio _dio;

  Dio get raw => _dio;

  Future<Response<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    return _dio.get(
      endpoint,
      queryParameters: queries,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? queries,
    dynamic data,
    Map<String, dynamic>? headers,
    Duration? duration,
  }) async {
    if (duration != null) {
      _dio.options = _dio.options.copyWith(
        receiveTimeout: duration,
        connectTimeout: duration,
        sendTimeout: duration,
      );
    } else {
      _dio.options = _dio.options.copyWith(
        receiveTimeout: AppConstants.duration25s,
        connectTimeout: AppConstants.duration25s,
        sendTimeout: AppConstants.duration25s,
      );
    }

    return _dio.post(
      endpoint,
      queryParameters: queries,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.put(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> patch(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.patch(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.delete(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> postOrPut(
    String endpoint, {
    required bool isAdd,
    Map<String, dynamic>? queries,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return isAdd
        ? _dio.post(
            endpoint,
            queryParameters: queries,
            data: data,
            options: Options(headers: headers),
          )
        : _dio.put(
            endpoint,
            queryParameters: queries,
            data: data,
            options: Options(headers: headers),
          );
  }

  Future<void> setAuthToken(String? token) async {
    final prefs = await SharedPreferences.getInstance();
    if (token == null || token.isEmpty) {
      await prefs.remove('token');
    } else {
      await prefs.setString('token', token);
    }
  }

  Future<void> setTenantId(int? tenantId) async {
    final prefs = await SharedPreferences.getInstance();
    if (tenantId == null) {
      await prefs.remove('abp_tenant_id');
    } else {
      await prefs.setInt('abp_tenant_id', tenantId);
    }
  }

  Future<void> setLanguageCode(String? langCode) async {
    final prefs = await SharedPreferences.getInstance();
    if (langCode == null || langCode.isEmpty) {
      await prefs.remove('lang_code');
    } else {
      await prefs.setString('lang_code', langCode);
    }
  }

  Future<void> setIanaTimeZone(String? iana) async {
    final prefs = await SharedPreferences.getInstance();
    if (iana == null || iana.isEmpty) {
      await prefs.remove('iana_tz');
    } else {
      await prefs.setString('iana_tz', iana);
    }
  }

  Future<void> clearAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('abp_tenant_id');
  }
}

void dioPrint(Object object) {
  debugPrint(object.toString());
}
