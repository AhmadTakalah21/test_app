// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appointments_app/features/app_manager/cubit/app_manager_cubit.dart'
    as _i816;
import 'package:appointments_app/features/auth/cubit/auth_cubit.dart' as _i22;
import 'package:appointments_app/features/auth/service/auth_service.dart'
    as _i269;
import 'package:appointments_app/features/auth_manager/bloc/auth_manager_bloc.dart'
    as _i144;
import 'package:appointments_app/global/di/app_module.dart' as _i1054;
import 'package:appointments_app/global/dio/dio_client.dart' as _i813;
import 'package:appointments_app/global/services/user_repo.dart' as _i960;
import 'package:appointments_app/global/theme/cubit/theme_cubit.dart' as _i181;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i816.AppManagerCubit>(() => _i816.AppManagerCubit());
    gh.singleton<_i144.AuthManagerBloc>(() => _i144.AuthManagerBloc());
    gh.singleton<_i813.DioClient>(() => _i813.DioClient());
    await gh.singletonAsync<_i960.UserRepo>(
      () {
        final i = _i960.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i181.ThemeCubit>(
        () => _i181.ThemeCubit(gh<_i460.SharedPreferences>()));
    gh.factory<_i269.AuthService>(() => _i269.AuthServiceImp());
    gh.factory<_i22.AuthCubit>(() => _i22.AuthCubit(
          gh<_i269.AuthService>(),
          gh<_i144.AuthManagerBloc>(),
        ));
    return this;
  }
}

class _$AppModule extends _i1054.AppModule {}
