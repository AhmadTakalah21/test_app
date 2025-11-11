import 'package:appointments_app/features/auth/view/widgets/auth_header.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:appointments_app/global/widgets/main_action_button.dart';
import 'package:appointments_app/global/widgets/main_text_field.dart';
import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SignUpWithEmailViewCallBacks {
  void onShowPassword();
  void onConfirmTap();
}

@RoutePage()
class SignUpWithEmailView extends StatelessWidget {
  const SignUpWithEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpWithEmailPage();
  }
}

class SignUpWithEmailPage extends StatefulWidget {
  const SignUpWithEmailPage({super.key});

  @override
  State<SignUpWithEmailPage> createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage>
    implements SignUpWithEmailViewCallBacks {
  bool isObsecurePassword = true;
  @override
  void onShowPassword() =>
      setState(() => isObsecurePassword = !isObsecurePassword);
      
  @override
  void onConfirmTap() {
    // TODO: implement onConfirmTap
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
              AuthHeader(title: "enter_strong_pass".tr()),
              Spacer(),
              MainTextField(
                title: "your_work_email".tr(),
                prefixIcon: SvgPicture.asset(
                  AppConstants.emailIconSvg,
                  width: 16,
                  height: 16,
                ),
              ),
              SizedBox(height: 20),
              MainTextField(
                title: "your_password".tr(),
                obscureText: true,
                maxLines: 1,
                suffixIcon: IconButton(
                  icon: Icon(
                    isObsecurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.greyShade3,
                  ),
                  onPressed: onShowPassword,
                ),
                prefixIcon: SvgPicture.asset(
                  AppConstants.lockIconSvg,
                  width: 16,
                  height: 16,
                ),
              ),
              SizedBox(height: 25),
              PasswordStrengthBar(strength: 0.5),
              SizedBox(height: 10),
              _buildIconWithTitle("not_enought_strong".tr(), false),
              _buildIconWithText("pass_7_chars".tr(), true),
              SizedBox(height: 5),
              _buildIconWithText("pass_uppercase_a_to_z".tr(), false),
              SizedBox(height: 20),
              MainActionButton(
                onPressed: onConfirmTap,
                buttonColor: AppColors.mainColorSecondary,
                text: "confirm_password".tr(),
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

  Widget _buildIconWithTitle(String text, bool isTrue) {
    final color = isTrue ? AppColors.greenShade : AppColors.yellowShade;
    final icon = isTrue ? Icons.done : Icons.warning_rounded;
    return Row(
      children: [
        Icon(icon, color: color),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: AppColors.blackShade2,
            fontSize: 15,
            height: 1.21,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildIconWithText(String text, bool isTrue) {
    final color = isTrue ? AppColors.greenShade : AppColors.redShade;
    final icon = isTrue ? Icons.done : Icons.close;
    return Row(
      children: [
        Icon(icon, color: color),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: AppColors.greyShade,
            fontSize: 12,
            height: 1.16,
          ),
        ),
      ],
    );
  }
}

class PasswordStrengthBar extends StatelessWidget {
  const PasswordStrengthBar({super.key, required this.strength});
  final double strength;

  @override
  Widget build(BuildContext context) {
    final color = strength < 1 ? AppColors.yellowShade : AppColors.greenShade;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 7,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: strength.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
