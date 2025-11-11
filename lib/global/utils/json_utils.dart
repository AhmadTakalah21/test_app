import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:appointments_app/global/dio/dio_client.dart';

typedef Json = Map<String, dynamic>;

abstract class JsonUtils {
  static void printPrettyJson(dynamic json, {String? prefix}) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String prettyprint = encoder.convert(json);
    if (prefix != null) {
      debugPrint('$prefix $prettyprint');
    } else {
      debugPrint(prettyprint);
    }
  }

  static void printJson(Json json, {String? prefix}) {
    if (prefix != null) {
      debugPrint('$prefix $json');
    } else {
      debugPrint(json.toString());
    }
  }

  static String setImageUrlFromJson(Map<String, dynamic> json) {
    String? path = json['payment_image'] ?? json['image'] ?? json['img'];
    return '${baseUrl}storage/$path';
  }

  static String? setImageUrlNullableFromJson(Map<String, dynamic> json) {
    String? path = json['payment_image'] ?? json['image'] ?? json['img'];
    return path == null ? null : '$baseUrl/storage/$path';
  }

  static Object? readValue(Map<dynamic, dynamic> json, String key) {
    return json;
  }

  static String stringFromJson(dynamic json) {
    return json.toString();
  }

  // static MultipartFile fileToJson(String path) {
  //   return MultipartFile.fromFileSync(path, filename: basename(path));
  // }
}
