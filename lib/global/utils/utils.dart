import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class Utils {
  static Color? stringToColor(String color) {
    final hex = int.tryParse(color.substring(6, 16));
    if (hex == null) return null;
    return Color(hex);
  }

  static String convertDateFormat(String inputDate) {
    final regex = RegExp(r'^\d{4}/\d{2}/\d{2}$');
    if (regex.hasMatch(inputDate)) {
      return inputDate;
    }
    DateTime parsedDate = DateTime.parse(inputDate);
    String formattedDate =
        "${parsedDate.year}/${twoDigits(parsedDate.month)}/${twoDigits(parsedDate.day)}";
    return formattedDate;
  }

  static String twoDigits(int n) => n.toString().padLeft(2, '0');

  static String? convertToIsoFormat(DateTime? date) {
    if (date == null) {
      return null;
    }
    return DateFormat('yyyy-MM-dd', 'en').format(date);
  }

  static double colorToHue(Color color) {
    final hsl = HSLColor.fromColor(color);
    return hsl.hue;
  }

  static String convertToIsoFormatFromString(String inputDate) {
    final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (regex.hasMatch(inputDate)) {
      return inputDate;
    }
    DateTime parsedDate = DateTime.parse(inputDate);
    return DateFormat('yyyy-MM-dd', 'en').format(parsedDate);
  }

  static String capitalizeFirst(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  static double calcSize(BuildContext context, double size) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      return (size / 390) * screenWidth / 1.2;
    }
    return (size / 390) * screenWidth;
  }

  static String? validateInput(
    String? val,
    InputTextType type, {
    String emptyMessage = 'required',
  }) {
    if (val == null || val.trim().isEmpty) {
      return emptyMessage.tr();
    }
    if (type == InputTextType.email) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      if (!emailRegex.hasMatch(val)) {
        return 'email_invalid'.tr();
      }
    } else if (type == InputTextType.phone) {
      if (val.length != 10) {
        return 'phone_number_10_digits'.tr();
      } else if (!val.startsWith('09')) {
        return 'phone_number_start_09'.tr();
      }
    } else if (type == InputTextType.password) {
      if (val.length < 8) {
        return 'password_8_chars'.tr();
      }
    }
    return null;
  }

  static String? validatePassword(
    String password, {
    required bool requireDigit,
    required bool requireLowercase,
    required bool requireNonAlphanumeric,
    required bool requireUppercase,
    required int requiredLength,
  }) {
    if (password.length < requiredLength) {
      return 'Password must be at least $requiredLength characters long';
    }

    if (requireDigit && !RegExp(r'\d').hasMatch(password)) {
      return 'Password must contain at least one digit';
    }

    if (requireLowercase && !RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (requireUppercase && !RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (requireNonAlphanumeric && !RegExp(r'[^a-zA-Z0-9]').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static bool validateLenght(String password, int requiredLength) =>
      password.length >= requiredLength;

  static bool validateDigits(String password) =>
      RegExp(r'\d').hasMatch(password);

  static bool validateLowerCase(String password) =>
      RegExp(r'[a-z]').hasMatch(password);

  static bool validateUpperCase(String password) =>
      RegExp(r'[A-Z]').hasMatch(password);

  static bool validateNonAlphanumeric(String password) =>
      RegExp(r'[^a-zA-Z0-9]').hasMatch(password);
}

enum InputTextType { email, phone, password, none }
