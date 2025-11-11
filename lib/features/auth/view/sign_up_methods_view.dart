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
  void onContinueWithGoogle() {
    // TODO: implement onContinueWithGoogle
  }

  @override
  void onTermsOfServiceAndPrivacyPolicy() {
    // TODO: implement onTermsOfServiceAndPrivacyPolicy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthHeader(title: "create_account".tr()),
              Spacer(),
              MainActionButton(
                onPressed: onContinueWithGoogle,
                buttonColor: AppColors.greyShade2,
                textColor: AppColors.blackShade,
                text: "continue_with_google".tr(),
                iconAsset: AppConstants.googleIconSvg,
              ),
              SizedBox(height: 30),
              Text(
                "or".tr(),
                style: TextStyle(
                  color: AppColors.greyShade,
                  fontSize: 12,
                  height: 1.16,
                ),
              ),
              SizedBox(height: 30),
              MainActionButton(
                onPressed: onContinueWithEmail,
                text: "continue_with_email".tr(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: AppConstants.paddingH30,
                child: Text.rich(
                  TextSpan(
                    text: "you_agree".tr(),
                    children: [
                      TextSpan(
                        text: "terms_privacy".tr(),
                        style: TextStyle(decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = onTermsOfServiceAndPrivacyPolicy,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  strutStyle: StrutStyle(height: 1.2),
                  style: TextStyle(
                    color: AppColors.greyShade,
                    fontSize: 13,
                    height: 1.18,
                  ),
                ),
              ),
              Spacer(),
              AuthTail(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
