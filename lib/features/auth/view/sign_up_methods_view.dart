import 'package:appointments_app/features/auth/cubit/auth_cubit.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_header.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:appointments_app/global/di/di.dart';
import 'package:appointments_app/global/localization/supported_locales.dart';
import 'package:appointments_app/global/router/app_router.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:appointments_app/global/widgets/loading_indicator.dart';
import 'package:appointments_app/global/widgets/main_action_button.dart';
import 'package:appointments_app/global/widgets/main_app_bar.dart';
import 'package:appointments_app/global/widgets/main_error_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignUpMethodsViewCallBacks {
  void onContinueWithEmail();
  void onContinueWithGoogle();
  void onTermsOfServiceAndPrivacyPolicy();
  void onSignInTap();
  void onTryAgainTap();
}

@RoutePage()
class SignUpMethodsView extends StatelessWidget {
  const SignUpMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<AuthCubit>(),
      child: const SignUpMethodsPage(),
    );
  }
}

class SignUpMethodsPage extends StatefulWidget {
  const SignUpMethodsPage({super.key});

  @override
  State<SignUpMethodsPage> createState() => _SignUpMethodsPageState();
}

class _SignUpMethodsPageState extends State<SignUpMethodsPage>
    implements SignUpMethodsViewCallBacks {
  late final AuthCubit authCubit = context.read();

  @override
  void initState() {
    super.initState();
    authCubit.getCurrentLoginInfo();
  }

  @override
  void onContinueWithEmail() =>
      context.router.push(SignUpWithEmailRoute(authCubit: authCubit));

  @override
  void onContinueWithGoogle() {}

  @override
  void onTryAgainTap() => authCubit.getCurrentLoginInfo();

  @override
  void onTermsOfServiceAndPrivacyPolicy() {
    // TODO: افتح صفحة الشروط والخصوصية لاحقًا
  }

  @override
  void onSignInTap() {
    // TODO: اربط Route تسجيل الدخول لاحقًا (مثال): context.router.replace(const SignInRoute());
    context.router.maybePop();
  }

  String _currentLangLabel(BuildContext context) {
    final code = context.locale.languageCode;
    return code == 'ar' ? 'العربية' : 'English';
  }

  Future<void> _setLocale(Locale locale) async {
    if (context.locale == locale) return;
    await context.setLocale(locale);
    if (mounted) setState(() {});
  }

  Widget _buildLanguageInlineSelector() {
    return Padding(
      padding: AppConstants.paddingH30,
      child: Center(
        child: _LanguageSelector(
          label: _currentLangLabel(context),
          onSelectLang: (lang) => _setLocale(Locale(lang)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(onBack: onSignInTap, title: "sign_in".tr()),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: AppConstants.padding16,
          child: BlocConsumer<AuthCubit, AuthState>(
            buildWhen: (previous, current) => current is CurrentLoginInfoState,
            listener: (context, state) {
              if (state is CurrentLoginInfoSuccess) {
                final info = state.loginInfo;
                if (info.user != null && info.tenant == null) {
                  context.router.push(SignUpTenantRoute(authCubit: authCubit));
                } else if (info.user != null && info.tenant != null) {
                  context.router.push(SignUpSuccessRoute());
                }
              }
            },
            builder: (context, state) {
              Widget? widget;
              bool isLoading = state is CurrentLoginInfoLoading;
              bool isError = state is CurrentLoginInfoFail;
              bool enabled = state is CurrentLoginInfoSuccess;
              if (isLoading) widget = LoadingIndicator();
              if (isError) {
                widget = MainErrorWidget(
                  error: state.error,
                  onTryAgainTap: onTryAgainTap,
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthHeader(title: "create_account".tr()),
                  if (widget != null) ...[const Spacer(), widget],
                  const Spacer(),

                  MainActionButton(
                    onPressed: onContinueWithGoogle,
                    buttonColor: AppColors.greyShade2,
                    textColor: AppColors.blackShade,
                    text: "continue_with_google".tr(),
                    iconAsset: AppConstants.googleIconSvg,
                    enabled: enabled,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    "or".tr(),
                    style: const TextStyle(
                      color: AppColors.greyShade,
                      fontSize: 12,
                      height: 1.16,
                    ),
                  ),

                  const SizedBox(height: 24),

                  MainActionButton(
                    onPressed: onContinueWithEmail,
                    text: "continue_with_email".tr(),
                    enabled: enabled,
                  ),

                  const SizedBox(height: 16),

                  Padding(
                    padding: AppConstants.paddingH30,
                    child: Text.rich(
                      TextSpan(
                        text: "you_agree".tr(),
                        children: [
                          TextSpan(
                            text: "terms_privacy".tr(),
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = onTermsOfServiceAndPrivacyPolicy,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      strutStyle: const StrutStyle(height: 1.2),
                      style: const TextStyle(
                        color: AppColors.greyShade,
                        fontSize: 13,
                        height: 1.18,
                      ),
                    ),
                  ),

                  const Spacer(),

                  _buildLanguageInlineSelector(),

                  const SizedBox(height: 20),

                  const AuthTail(),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector({required this.label, required this.onSelectLang});

  final String label;
  final void Function(String lang) onSelectLang;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: '',
      position: PopupMenuPosition.over,
      offset: const Offset(0, -4),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: onSelectLang,
      itemBuilder: (context) {
        return SupportedLocales.languages
            .map(
              (language) => PopupMenuItem(
                value: language.locale.languageCode,
                height: 40,
                padding: AppConstants.padding0,
                child: Center(
                  child: Text(
                    language.label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.greyShade,
                      height: 1.16,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            )
            .toList();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.language, color: AppColors.greyShade, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.greyShade,
              height: 1.16,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.arrow_drop_down_rounded,
            color: AppColors.greyShade,
            //size: 18,
          ),
        ],
      ),
    );
  }
}
