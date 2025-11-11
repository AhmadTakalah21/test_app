import 'package:appointments_app/features/auth/view/widgets/auth_header.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:appointments_app/global/router/app_router.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:appointments_app/global/widgets/main_action_button.dart';
import 'package:appointments_app/global/widgets/main_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

abstract class SignUpTenantViewCallBacks {
  void onCreateWorkspace();
}

@RoutePage()
class SignUpTenantView extends StatelessWidget {
  const SignUpTenantView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpTenantPage();
  }
}

class SignUpTenantPage extends StatefulWidget {
  const SignUpTenantPage({super.key});

  @override
  State<SignUpTenantPage> createState() => _SignUpTenantPageState();
}

class _SignUpTenantPageState extends State<SignUpTenantPage>
    implements SignUpTenantViewCallBacks {
  @override
  void onCreateWorkspace() => context.router.push(SignUpWithEmailRoute());

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
              MainTextField(title: "Your  company or team name".tr()),
              SizedBox(height: 20),
              MainTextField(title: "Your  company or team name".tr()),
              SizedBox(height: 20),
              MainTextField(title: "Your  company or team name".tr()),
              SizedBox(height: 20),
              MainActionButton(
                onPressed: onCreateWorkspace,
                text: "create_workspace".tr(),
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
