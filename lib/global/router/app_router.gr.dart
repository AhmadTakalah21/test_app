// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter();

  @override
  final Map<String, PageFactory> pagesMap = {
    AppManagerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppManagerView(),
      );
    },
    AuthManagerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthManagerView(),
      );
    },
    AuthRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AutoRouter(),
      );
    },
    SignUpMethodsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpMethodsView(),
      );
    },
    SignUpSuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpSuccessView(),
      );
    },
    SignUpTenantRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpTenantRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpTenantView(
          key: args.key,
          authCubit: args.authCubit,
        ),
      );
    },
    SignUpWithEmailRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpWithEmailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpWithEmailView(
          key: args.key,
          authCubit: args.authCubit,
        ),
      );
    },
  };
}

/// generated route for
/// [AppManagerView]
class AppManagerRoute extends PageRouteInfo<void> {
  const AppManagerRoute({List<PageRouteInfo>? children})
      : super(
          AppManagerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppManagerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthManagerView]
class AuthManagerRoute extends PageRouteInfo<void> {
  const AuthManagerRoute({List<PageRouteInfo>? children})
      : super(
          AuthManagerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthManagerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthRouter]
class AuthRouter extends PageRouteInfo<void> {
  const AuthRouter({List<PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpMethodsView]
class SignUpMethodsRoute extends PageRouteInfo<void> {
  const SignUpMethodsRoute({List<PageRouteInfo>? children})
      : super(
          SignUpMethodsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpMethodsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpSuccessView]
class SignUpSuccessRoute extends PageRouteInfo<void> {
  const SignUpSuccessRoute({List<PageRouteInfo>? children})
      : super(
          SignUpSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpSuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpTenantView]
class SignUpTenantRoute extends PageRouteInfo<SignUpTenantRouteArgs> {
  SignUpTenantRoute({
    Key? key,
    required AuthCubit authCubit,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpTenantRoute.name,
          args: SignUpTenantRouteArgs(
            key: key,
            authCubit: authCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'SignUpTenantRoute';

  static const PageInfo<SignUpTenantRouteArgs> page =
      PageInfo<SignUpTenantRouteArgs>(name);
}

class SignUpTenantRouteArgs {
  const SignUpTenantRouteArgs({
    this.key,
    required this.authCubit,
  });

  final Key? key;

  final AuthCubit authCubit;

  @override
  String toString() {
    return 'SignUpTenantRouteArgs{key: $key, authCubit: $authCubit}';
  }
}

/// generated route for
/// [SignUpWithEmailView]
class SignUpWithEmailRoute extends PageRouteInfo<SignUpWithEmailRouteArgs> {
  SignUpWithEmailRoute({
    Key? key,
    required AuthCubit authCubit,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpWithEmailRoute.name,
          args: SignUpWithEmailRouteArgs(
            key: key,
            authCubit: authCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'SignUpWithEmailRoute';

  static const PageInfo<SignUpWithEmailRouteArgs> page =
      PageInfo<SignUpWithEmailRouteArgs>(name);
}

class SignUpWithEmailRouteArgs {
  const SignUpWithEmailRouteArgs({
    this.key,
    required this.authCubit,
  });

  final Key? key;

  final AuthCubit authCubit;

  @override
  String toString() {
    return 'SignUpWithEmailRouteArgs{key: $key, authCubit: $authCubit}';
  }
}
