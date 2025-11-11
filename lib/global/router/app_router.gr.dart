// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appointments_app/features/app_manager/view/app_manager_view.dart'
    as _i1;
import 'package:appointments_app/features/auth/view/auth_router.dart' as _i3;
import 'package:appointments_app/features/auth/view/sign_up_methods_view.dart'
    as _i4;
import 'package:appointments_app/features/auth_manager/view/auth_manager_view.dart'
    as _i2;
import 'package:auto_route/auto_route.dart' as _i5;

/// generated route for
/// [_i1.AppManagerView]
class AppManagerRoute extends _i5.PageRouteInfo<void> {
  const AppManagerRoute({List<_i5.PageRouteInfo>? children})
    : super(AppManagerRoute.name, initialChildren: children);

  static const String name = 'AppManagerRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppManagerView();
    },
  );
}

/// generated route for
/// [_i2.AuthManagerView]
class AuthManagerRoute extends _i5.PageRouteInfo<void> {
  const AuthManagerRoute({List<_i5.PageRouteInfo>? children})
    : super(AuthManagerRoute.name, initialChildren: children);

  static const String name = 'AuthManagerRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthManagerView();
    },
  );
}

/// generated route for
/// [_i3.AuthRouter]
class AuthRouter extends _i5.PageRouteInfo<void> {
  const AuthRouter({List<_i5.PageRouteInfo>? children})
    : super(AuthRouter.name, initialChildren: children);

  static const String name = 'AuthRouter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.AuthRouter();
    },
  );
}

/// generated route for
/// [_i4.SignUpMethodsView]
class SignUpMethodsRoute extends _i5.PageRouteInfo<void> {
  const SignUpMethodsRoute({List<_i5.PageRouteInfo>? children})
    : super(SignUpMethodsRoute.name, initialChildren: children);

  static const String name = 'SignUpMethodsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignUpMethodsView();
    },
  );
}
