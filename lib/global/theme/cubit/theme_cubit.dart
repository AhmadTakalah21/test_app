import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this.prefs) : super(ThemeInitial()) {
    loadThemeMode();
  }
  final SharedPreferences prefs;

  ThemeMode loadThemeMode() {
    final themeString = prefs.getString('themeMode');
    ThemeMode themeMode;
    switch (themeString) {
      case 'ThemeMode.light':
        themeMode = ThemeMode.light;
      case 'ThemeMode.dark':
        themeMode = ThemeMode.dark;
      default:
        themeMode = ThemeMode.light;
    }
    emit(ThemeChanged(themeMode));
    return themeMode;
  }

  bool getIsDark() => loadThemeMode() == ThemeMode.dark;

  Future<void> changeTheme(bool isDark) async {
    ThemeMode newThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    await prefs.setString('themeMode', newThemeMode.toString());
    emit(ThemeChanged(newThemeMode));
  }
}
