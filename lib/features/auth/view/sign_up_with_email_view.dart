import 'package:appointments_app/features/auth/cubit/auth_cubit.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_header.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:appointments_app/global/router/app_router.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:appointments_app/global/utils/utils.dart';
import 'package:appointments_app/global/widgets/loading_indicator.dart';
import 'package:appointments_app/global/widgets/main_action_button.dart';
import 'package:appointments_app/global/widgets/main_app_bar.dart';
import 'package:appointments_app/global/widgets/main_error_widget.dart';
import 'package:appointments_app/global/widgets/main_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SignUpWithEmailViewCallBacks {
  void onShowPassword();
  void onConfirmTap();
  void onTryAgainTap();
}

@RoutePage()
class SignUpWithEmailView extends StatelessWidget {
  const SignUpWithEmailView({super.key, required this.authCubit});
  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) =>
      BlocProvider.value(value: authCubit, child: const SignUpWithEmailPage());
}

class SignUpWithEmailPage extends StatefulWidget {
  const SignUpWithEmailPage({super.key});

  @override
  State<SignUpWithEmailPage> createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage>
    implements SignUpWithEmailViewCallBacks {
  late final AuthCubit authCubit = context.read();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool isObsecurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailController.addListener(_onEmailChanged);
    passwordController = TextEditingController();
    passwordController.addListener(_onPasswordChanged);
    authCubit.getPasswordComplexity();
  }

  double passwordStrength = 0;
  bool isPasswordValid = false;
  bool isEmailValid = false;

  bool isValidLength = false;
  bool isValidLowerCase = false;
  bool isValidUpperCase = false;
  bool isValidDigit = false;
  bool isValidNonAlphanumeric = false;

  void _onEmailChanged() {
    final email = emailController.text;
    setState(() {
      isEmailValid = Utils.validateInput(email, InputTextType.email) == null;
    });
  }

  void _onPasswordChanged() {
    final password = passwordController.text;
    if (authCubit.state is PasswordComplexitySuccess) {
      final passStrength =
          (authCubit.state as PasswordComplexitySuccess).passStrength;

      final checks = [
        Utils.validateLenght(password, passStrength.requiredLength),
        if (passStrength.requireDigit) Utils.validateDigits(password),
        if (passStrength.requireLowercase) Utils.validateLowerCase(password),
        if (passStrength.requireUppercase) Utils.validateUpperCase(password),
        if (passStrength.requireNonAlphanumeric)
          Utils.validateNonAlphanumeric(password),
      ];

      final validCount = checks.where((e) => e).length;
      final totalCount = checks.length;

      setState(() {
        isValidLength = Utils.validateLenght(
          password,
          passStrength.requiredLength,
        );

        isValidDigit =
            (passStrength.requireDigit && Utils.validateDigits(password));

        isValidLowerCase =
            (passStrength.requireLowercase &&
            Utils.validateLowerCase(password));

        isValidUpperCase =
            (passStrength.requireUppercase &&
            Utils.validateUpperCase(password));

        isValidNonAlphanumeric =
            (passStrength.requireNonAlphanumeric &&
            Utils.validateNonAlphanumeric(password));

        passwordStrength = validCount / totalCount;
        isPasswordValid = validCount == totalCount;
      });
    }
  }

  @override
  void onTryAgainTap() => authCubit.getPasswordComplexity();

  @override
  void onShowPassword() =>
      setState(() => isObsecurePassword = !isObsecurePassword);

  @override
  void onConfirmTap() => context.router.push(const SignUpTenantRoute());

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthHeader(title: "enter_strong_pass".tr()),

              const Spacer(),

              MainTextField(
                controller: emailController,
                title: "your_work_email".tr(),
                style: MainTextFieldStyle.underline,
                contentPadding: const EdgeInsets.only(top: 12),
                hintText: "email@gmail.com",
                onChanged: authCubit.setAdminEmail,
                textInputAction: TextInputAction.next,
                prefixIcon: SvgPicture.asset(
                  AppConstants.emailIconSvg,
                  width: 16,
                  height: 16,
                ),
              ),

              const SizedBox(height: 20),

              MainTextField(
                controller: passwordController,
                title: "your_password".tr(),
                style: MainTextFieldStyle.underline,
                contentPadding: const EdgeInsets.only(top: 12),
                textInputAction: TextInputAction.done,
                obscureText: isObsecurePassword,
                onChanged: authCubit.setAdminPassword,
                hintText: "********",
                maxLines: 1,
                suffixIcon: IconButton(
                  onPressed: onShowPassword,
                  icon: Icon(
                    isObsecurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.greyShade3,
                  ),
                ),
                prefixIcon: SvgPicture.asset(
                  AppConstants.lockIconSvg,
                  width: 16,
                  height: 16,
                ),
              ),

              const SizedBox(height: 25),

              PasswordStrengthBar(strength: passwordStrength),

              const SizedBox(height: 16),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is PasswordComplexityLoading) {
                    return LoadingIndicator();
                  } else if (state is PasswordComplexitySuccess) {
                    final passStrength = state.passStrength;
                    return Column(
                      children: [
                        _buildIconWithTitle(isPasswordValid),
                        const SizedBox(height: 5),
                        _buildIconWithText(
                          "pass_x_chars".tr(
                            args: [passStrength.requiredLength.toString()],
                          ),
                          isValidLength,
                        ),
                        if (passStrength.requireUppercase) ...[
                          const SizedBox(height: 5),
                          _buildIconWithText(
                            "pass_uppercase_a_to_z".tr(),
                            isValidUpperCase,
                          ),
                        ],
                        if (passStrength.requireLowercase) ...[
                          const SizedBox(height: 5),
                          _buildIconWithText(
                            "pass_lowercase_a_to_z".tr(),
                            isValidLowerCase,
                          ),
                        ],
                        if (passStrength.requireDigit) ...[
                          const SizedBox(height: 5),
                          _buildIconWithText("pass_digit".tr(), isValidDigit),
                        ],
                        if (passStrength.requireNonAlphanumeric) ...[
                          const SizedBox(height: 5),
                          _buildIconWithText(
                            "pass_non_alphanumeric".tr(),
                            isValidNonAlphanumeric,
                          ),
                        ],
                      ],
                    );
                  } else if (state is PasswordComplexityFail) {
                    return MainErrorWidget(
                      error: state.error,
                      onTryAgainTap: onTryAgainTap,
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),

              const SizedBox(height: 20),

              MainActionButton(
                onPressed: onConfirmTap,
                text: "confirm_password".tr(),
                enabled: isPasswordValid && isEmailValid,
              ),

              const Spacer(),
              const AuthTail(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithTitle(bool isTrue) {
    final color = isTrue ? AppColors.greenShade : AppColors.yellowShade;
    final icon = isTrue ? Icons.done : Icons.warning_rounded;
    final text = isTrue ? "strong_enought" : "not_enought_strong";
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 5),
        Text(
          text.tr(),
          style: const TextStyle(
            color: AppColors.blackShade2,
            fontSize: 15,
            height: 1.21,
            fontWeight: FontWeight.w600,
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
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.greyShade,
              fontSize: 12,
              height: 1.16,
            ),
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
        color: const Color(0xFFEAEAEA),
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
