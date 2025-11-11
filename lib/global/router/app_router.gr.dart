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

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AppManagerRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppManagerView(),
      );
    },
    AuthManagerRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthManagerView(),
      );
    },
    AuthRouter.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AuthRouter(),
      );
    },
    SignUpMethodsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpMethodsView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppManagerView]
class AppManagerRoute extends _i5.PageRouteInfo<void> {
  const AppManagerRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AppManagerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppManagerRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthManagerView]
class AuthManagerRoute extends _i5.PageRouteInfo<void> {
  const AuthManagerRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthManagerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthManagerRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AuthRouter]
class AuthRouter extends _i5.PageRouteInfo<void> {
  const AuthRouter({List<_i5.PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthRouter';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignUpMethodsView]
class SignUpMethodsRoute extends _i5.PageRouteInfo<void> {
  const SignUpMethodsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignUpMethodsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpMethodsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
