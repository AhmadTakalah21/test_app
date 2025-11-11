// import 'package:appointments_app/features/app_manager/view/app_manager_view.dart';
// import 'package:appointments_app/features/auth/view/sign_up_methods_view.dart';
// import 'package:appointments_app/features/auth/view/sign_up_success_view.dart';
// import 'package:appointments_app/features/auth/view/sign_up_tenant_view.dart';
// import 'package:appointments_app/features/auth/view/sign_up_with_email_view.dart';
// import 'package:appointments_app/features/auth_manager/view/auth_manager_view.dart';
import 'package:appointments_app/features/app_manager/view/app_manager_view.dart';
import 'package:appointments_app/features/auth/cubit/auth_cubit.dart';
import 'package:appointments_app/features/auth/view/sign_up_methods_view.dart';
import 'package:appointments_app/features/auth/view/sign_up_success_view.dart';
import 'package:appointments_app/features/auth/view/sign_up_tenant_view.dart';
import 'package:appointments_app/features/auth/view/sign_up_with_email_view.dart';
import 'package:appointments_app/features/auth_manager/view/auth_manager_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Tab|Page,Route')
class AppRouter extends _$AppRouter {
// class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // CustomRoute(
    //   initial: true,
    //   transitionsBuilder: TransitionsBuilders.noTransition,
    //   page: SplashRoute.page,
    // ),
    AdaptiveRoute(
      initial: true,
      page: AuthManagerRoute.page,
      children: [
        AdaptiveRoute(
          page: AuthRouter.page,
          children: [
            AutoRoute(page: SignUpMethodsRoute.page, initial: true),
            AutoRoute(page: SignUpWithEmailRoute.page),
            AutoRoute(page: SignUpTenantRoute.page),
            AutoRoute(page: SignUpSuccessRoute.page),
            // AutoRoute(page: SignInRoute.page, initial: true),
            // AutoRoute(page: SignUpRoute.page),
            // AutoRoute(page: VerifyRoute.page),
            // AutoRoute(page: ForgetPasswordRoute.page),
            // AutoRoute(page: ResetPasswordRoute.page),
          ],
        ),
        AdaptiveRoute(page: AppManagerRoute.page),
      ],
    ),
  ];
}
