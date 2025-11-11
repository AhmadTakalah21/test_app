import 'package:appointments_app/global/services/user_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointments_app/features/app/app_material_app.dart';
import 'package:appointments_app/features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:appointments_app/global/di/di.dart';
import 'package:appointments_app/global/localization/supported_locales.dart';
import 'package:appointments_app/global/theme/cubit/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => get<UserRepo>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => get<ThemeCubit>()),
          BlocProvider(create: (context) => get<AuthManagerBloc>()),
        ],
        child: EasyLocalization(
          supportedLocales: SupportedLocales.locales,
          path: SupportedLocales.path,
          fallbackLocale: SupportedLocales.arabic,
          startLocale: SupportedLocales.arabic,
          child: const AppMaterialApp(),
        ),
      ),
    );
  }
}
