import 'package:flutter/material.dart';

abstract class AppColors {
  static const mainColor = Color(0xFF4E86F7);
  static const mainColorSecondary = Color(0xFFB5B5B5);
  static const black = Colors.black;
  static const blackShade = Color(0xFF0E0F12);
  static const white = Colors.white;
  static const green = Colors.green;
  static const red = Colors.red;
  static const blue = Colors.blue;
  static const grey = Colors.grey;
  static const greyShade = Color(0xFF555555);

  static List<BoxShadow> fisrtShadow = [
    BoxShadow(
      color: black.withValues(alpha: 0.3),
      blurRadius: 1,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> secondShadow = [
    BoxShadow(
      color: black.withValues(alpha: 0.3),
      blurRadius: 2,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> thirdShadow = [
    BoxShadow(
      color: black.withValues(alpha: 0.3),
      blurRadius: 4,
      offset: const Offset(0, 4),
    ),
  ];

}
