part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeChanged extends ThemeState {
  final ThemeMode themeMode;

  ThemeChanged(this.themeMode);
}

// @immutable
// class ThemeState {
//   const ThemeState({required this.themeMode});
//   final ThemeMode themeMode;
// }
