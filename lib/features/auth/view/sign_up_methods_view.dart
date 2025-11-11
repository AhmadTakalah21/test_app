import 'package:appointments_app/features/auth/view/widgets/auth_header.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:appointments_app/global/router/app_router.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:appointments_app/global/widgets/main_action_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

abstract class SignUpMethodsViewCallBacks {
  void onContinueWithEmail();
  void onContinueWithGoogle();
  void onTermsOfServiceAndPrivacyPolicy();
  void onSignInTap();
}

@RoutePage()
class SignUpMethodsView extends StatelessWidget {
  const SignUpMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpMethodsPage();
  }
}

class SignUpMethodsPage extends StatefulWidget {
  const SignUpMethodsPage({super.key});

  @override
  State<SignUpMethodsPage> createState() => _SignUpMethodsPageState();
}

class _SignUpMethodsPageState extends State<SignUpMethodsPage>
    implements SignUpMethodsViewCallBacks {
  @override
  void onContinueWithEmail() => context.router.push(SignUpWithEmailRoute());

  @override
  void onContinueWithGoogle() {}

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
          onSelectEnglish: () => _setLocale(const Locale('en')),
          onSelectArabic: () => _setLocale(const Locale('ar')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 48,
        leadingWidth: 140,
        leading: InkWell(
          borderRadius: AppConstants.borderRadius30,
          onTap: onSignInTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(width: 8),
              Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.mainColor,
                size: 20,
              ),
              SizedBox(width: 2),
              Text(
                'Sign in',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthHeader(title: "create_account".tr()),
              const Spacer(),

              MainActionButton(
                onPressed: onContinueWithGoogle,
                buttonColor: AppColors.greyShade2,
                textColor: AppColors.blackShade,
                text: "continue_with_google".tr(),
                iconAsset: AppConstants.googleIconSvg,
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
          ),
        ),
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector({
    required this.label,
    required this.onSelectEnglish,
    required this.onSelectArabic,
  });

  final String label;
  final VoidCallback onSelectEnglish;
  final VoidCallback onSelectArabic;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: '',
      position: PopupMenuPosition.over,
      offset: const Offset(0, -4),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) {
        if (value == 'en') onSelectEnglish();
        if (value == 'ar') onSelectArabic();
      },
      itemBuilder: (ctx) => [
        PopupMenuItem(
          value: 'en',
          child: Row(
            children: const [
              Icon(Icons.language, size: 18),
              SizedBox(width: 8),
              Text('English', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'ar',
          child: Row(
            children: const [
              Icon(Icons.language, size: 18),
              SizedBox(width: 8),
              Text('العربية', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.language, color: AppColors.blackShade, size: 18),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.blackShade,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.blackShade,
            size: 18,
          ),
        ],
      ),
    );
  }
}
