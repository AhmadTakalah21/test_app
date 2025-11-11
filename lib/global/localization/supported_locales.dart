import 'package:flutter/material.dart';

abstract class SupportedLocales {
  static const english = Locale('en');
  static const arabic = Locale('ar');

  static final List<Locale> locales = [
    const Locale('en'),
    const Locale('ar'),
  ];

  static final List<LanguageModel> languages = [
    const LanguageModel(english,"English"),
    const LanguageModel(arabic,"العربية"),
  ];

  static const String path = 'assets/locales';
}

class LanguageModel {
  const LanguageModel(this.locale, this.label);

  final Locale locale;
  final String label;
}
