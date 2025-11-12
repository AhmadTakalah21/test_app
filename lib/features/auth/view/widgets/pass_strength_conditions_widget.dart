import 'package:appointments_app/features/auth/cubit/auth_cubit.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/widgets/loading_indicator.dart';
import 'package:appointments_app/global/widgets/main_error_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassStrengthConditionsWidget extends StatelessWidget {
  const PassStrengthConditionsWidget({
    super.key,
    required this.isPasswordValid,
    required this.isValidLength,
    required this.isValidUpperCase,
    required this.isValidLowerCase,
    required this.isValidDigit,
    required this.isValidNonAlphanumeric,
    required this.onTryAgainTap,
    required this.setRequiredLenght,
  });
  final bool isPasswordValid;
  final bool isValidLength;
  final bool isValidUpperCase;
  final bool isValidLowerCase;
  final bool isValidDigit;
  final bool isValidNonAlphanumeric;
  final void Function(int value) setRequiredLenght;
  final void Function() onTryAgainTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PasswordComplexitySuccess) {
          setRequiredLenght(state.passStrength.requiredLength);
        }
      },
      builder: (context, state) {
        if (state is PasswordComplexityLoading) {
          return const LoadingIndicator();
        } else if (state is PasswordComplexitySuccess) {
          final s = state.passStrength;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIconWithTitle(isPasswordValid),
              const SizedBox(height: 5),
              _buildIconWithText(
                "pass_x_chars".tr(args: [s.requiredLength.toString()]),
                isValidLength,
              ),
              if (s.requireUppercase) ...[
                const SizedBox(height: 5),
                _buildIconWithText(
                  "pass_uppercase_a_to_z".tr(),
                  isValidUpperCase,
                ),
              ],
              if (s.requireLowercase) ...[
                const SizedBox(height: 5),
                _buildIconWithText(
                  "pass_lowercase_a_to_z".tr(),
                  isValidLowerCase,
                ),
              ],
              if (s.requireDigit) ...[
                const SizedBox(height: 5),
                _buildIconWithText("pass_digit".tr(), isValidDigit),
              ],
              if (s.requireNonAlphanumeric) ...[
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
        }
        return const SizedBox.shrink();
      },
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

// import 'package:appointments_app/features/auth/cubit/auth_cubit.dart';
// import 'package:appointments_app/global/utils/app_colors.dart';
// import 'package:appointments_app/global/widgets/loading_indicator.dart';
// import 'package:appointments_app/global/widgets/main_error_widget.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PassStrengthConditionsWidget extends StatelessWidget {
//   const PassStrengthConditionsWidget({
//     super.key,
//     required this.onTryAgainTap,
//     required this.setRequiredLenght,
//   });

//   final void Function(int value) setRequiredLenght;
//   final void Function() onTryAgainTap;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthCubit, AuthState>(
//       buildWhen: (previous, current) => current is PasswordComplexityState,
//       listener: (context, state) {
//         if (state is PasswordComplexitySuccess) {
//           setRequiredLenght(state.passStrength.requiredLength);
//         }
//       },
//       builder: (context, state) {
//         final authCubit = context.read<AuthCubit>();

//         if (state is PasswordComplexityLoading) {
//           return const LoadingIndicator();
//         } else if (state is PasswordComplexitySuccess ||
//             state is PasswordValidationState) {
//           final passState = state is PasswordValidationState ? state : null;
//           final s = state is PasswordComplexitySuccess
//               ? state.passStrength
//               : (authCubit.state is PasswordComplexitySuccess
//                     ? (authCubit.state as PasswordComplexitySuccess)
//                           .passStrength
//                     : null);

//           final isValidLength = passState?.isValidLength ?? false;
//           final isValidUpper = passState?.isValidUpperCase ?? false;
//           final isValidLower = passState?.isValidLowerCase ?? false;
//           final isValidDigit = passState?.isValidDigit ?? false;
//           final isValidNonAlpha = passState?.isValidNonAlphanumeric ?? false;

//           // Full password validity
//           final isPasswordValid = [
//             isValidLength,
//             if (s?.requireUppercase ?? false) isValidUpper,
//             if (s?.requireLowercase ?? false) isValidLower,
//             if (s?.requireDigit ?? false) isValidDigit,
//             if (s?.requireNonAlphanumeric ?? false) isValidNonAlpha,
//           ].every((x) => x == true);

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildIconWithTitle(isPasswordValid),
//               const SizedBox(height: 5),
//               if (s != null) ...[
//                 _buildIconWithText(
//                   "pass_x_chars".tr(args: [s.requiredLength.toString()]),
//                   isValidLength,
//                 ),
//                 if (s.requireUppercase) ...[
//                   const SizedBox(height: 5),
//                   _buildIconWithText(
//                     "pass_uppercase_a_to_z".tr(),
//                     isValidUpper,
//                   ),
//                 ],
//                 if (s.requireLowercase) ...[
//                   const SizedBox(height: 5),
//                   _buildIconWithText(
//                     "pass_lowercase_a_to_z".tr(),
//                     isValidLower,
//                   ),
//                 ],
//                 if (s.requireDigit) ...[
//                   const SizedBox(height: 5),
//                   _buildIconWithText("pass_digit".tr(), isValidDigit),
//                 ],
//                 if (s.requireNonAlphanumeric) ...[
//                   const SizedBox(height: 5),
//                   _buildIconWithText(
//                     "pass_non_alphanumeric".tr(),
//                     isValidNonAlpha,
//                   ),
//                 ],
//               ],
//             ],
//           );
//         } else if (state is PasswordComplexityFail) {
//           return MainErrorWidget(
//             error: state.error,
//             onTryAgainTap: onTryAgainTap,
//           );
//         }

//         return const SizedBox.shrink();
//       },
//     );
//   }

//   Widget _buildIconWithTitle(bool isTrue) {
//     final color = isTrue ? AppColors.greenShade : AppColors.yellowShade;
//     final icon = isTrue ? Icons.done : Icons.warning_rounded;
//     final text = isTrue ? "strong_enought" : "not_enought_strong";
//     return Row(
//       children: [
//         Icon(icon, color: color),
//         const SizedBox(width: 5),
//         Text(
//           text.tr(),
//           style: const TextStyle(
//             color: AppColors.blackShade2,
//             fontSize: 15,
//             height: 1.21,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildIconWithText(String text, bool isTrue) {
//     final color = isTrue ? AppColors.greenShade : AppColors.redShade;
//     final icon = isTrue ? Icons.done : Icons.close;
//     return Row(
//       children: [
//         Icon(icon, color: color),
//         const SizedBox(width: 5),
//         Expanded(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: AppColors.greyShade,
//               fontSize: 12,
//               height: 1.16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
