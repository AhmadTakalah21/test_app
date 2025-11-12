import 'package:appointments_app/features/auth/cubit/auth_cubit.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_header.dart';
import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:appointments_app/features/auth/view/widgets/pass_strength_conditions_widget.dart';
import 'package:appointments_app/features/auth/view/widgets/password_strength_bar.dart';
import 'package:appointments_app/global/router/app_router.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:appointments_app/global/utils/utils.dart';
import 'package:appointments_app/global/widgets/main_action_button.dart';
import 'package:appointments_app/global/widgets/main_app_bar.dart';
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

  double passwordStrength = 0;
  bool isPasswordValid = false;
  bool isEmailValid = false;

  bool isValidLength = false;
  bool isValidLowerCase = false;
  bool isValidUpperCase = false;
  bool isValidDigit = false;
  bool isValidNonAlphanumeric = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController()..addListener(_onEmailChanged);
    passwordController = TextEditingController()
      ..addListener(_onPasswordChanged);
    authCubit.getPasswordComplexity();
  }

  @override
  void dispose() {
    emailController.removeListener(_onEmailChanged);
    passwordController.removeListener(_onPasswordChanged);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    final email = emailController.text;
    if (!mounted) return;
    setState(() {
      isEmailValid = Utils.validateInput(email, InputTextType.email) == null;
    });
    authCubit.setAdminEmail(email);
  }

  void _onPasswordChanged() {
    if (!mounted) return;
    final password = passwordController.text;

    if (authCubit.state is! PasswordComplexitySuccess) return;
    final passStrength =
        (authCubit.state as PasswordComplexitySuccess).passStrength;

    final checks = <bool>[
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
          passStrength.requireDigit && Utils.validateDigits(password);
      isValidLowerCase =
          passStrength.requireLowercase && Utils.validateLowerCase(password);
      isValidUpperCase =
          passStrength.requireUppercase && Utils.validateUpperCase(password);
      isValidNonAlphanumeric =
          passStrength.requireNonAlphanumeric &&
          Utils.validateNonAlphanumeric(password);

      passwordStrength = totalCount == 0 ? 0 : validCount / totalCount;
      isPasswordValid = validCount == totalCount && totalCount > 0;
    });

    authCubit.setAdminPassword(password);
  }

  @override
  void onTryAgainTap() => authCubit.getPasswordComplexity();

  @override
  void onShowPassword() =>
      setState(() => isObsecurePassword = !isObsecurePassword);

  @override
  void onConfirmTap() {
    if (isPasswordValid && isEmailValid) {
      context.router.push(SignUpTenantRoute(authCubit: authCubit));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: AppConstants.padding16,
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AuthHeader(title: "enter_strong_pass".tr()),
                      const SizedBox(height: 100),
                      Expanded(
                        child: Column(
                          children: [
                            _buildEmailTextField(),
                            const SizedBox(height: 20),
                            _buildPasswordTextField(),
                            const SizedBox(height: 25),
                            PasswordStrengthBar(strength: passwordStrength),
                            const SizedBox(height: 16),
                            PassStrengthConditionsWidget(
                              isPasswordValid: isPasswordValid,
                              isValidLength: isValidLength,
                              isValidUpperCase: isValidUpperCase,
                              isValidLowerCase: isValidLowerCase,
                              isValidDigit: isValidDigit,
                              isValidNonAlphanumeric: isValidNonAlphanumeric,
                              setRequiredLenght: authCubit.setRequiredLength,
                              onTryAgainTap: onTryAgainTap,
                            ),
                            const SizedBox(height: 20),
                            MainActionButton(
                              onPressed: onConfirmTap,
                              text: "confirm_password".tr(),
                              enabled: isPasswordValid && isEmailValid,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [AuthTail(), SizedBox(height: 40)],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return MainTextField(
      controller: emailController,
      title: "your_work_email".tr(),
      style: MainTextFieldStyle.underline,
      contentPadding: const EdgeInsets.only(top: 12),
      hintText: "email@gmail.com",
      textInputAction: TextInputAction.next,
      textInputType: TextInputType.emailAddress,
      prefixIcon: SvgPicture.asset(
        AppConstants.emailIconSvg,
        width: 16,
        height: 16,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return MainTextField(
      controller: passwordController,
      title: "your_password".tr(),
      style: MainTextFieldStyle.underline,
      contentPadding: const EdgeInsets.only(top: 12),
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => onConfirmTap(),
      obscureText: isObsecurePassword,
      hintText: "********",
      maxLines: 1,
      suffixIcon: IconButton(
        onPressed: onShowPassword,
        icon: Icon(
          isObsecurePassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: AppColors.greyShade3,
          size: 25,
        ),
      ),
      prefixIcon: SvgPicture.asset(
        AppConstants.lockIconSvg,
        width: 16,
        height: 16,
      ),
    );
  }
}
