import 'package:appointments_app/features/auth/view/widgets/auth_tail.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SignUpSuccessView extends StatelessWidget {
  const SignUpSuccessView({super.key});

  @override
  Widget build(BuildContext context) => const SignUpSuccessPage();
}

class SignUpSuccessPage extends StatefulWidget {
  const SignUpSuccessPage({super.key});

  @override
  State<SignUpSuccessPage> createState() => _SignUpSuccessPageState();
}

class _SignUpSuccessPageState extends State<SignUpSuccessPage> {
  static const double _titleSize = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            children: [
              Spacer(),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${'thank_you_title_line1'.tr()}\n",
                      style: const TextStyle(
                        color: AppColors.blackShade,
                        fontSize: _titleSize,
                        height: 1.25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    WidgetSpan(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "thank_you_title_line2".tr(),
                            style: const TextStyle(
                              color: AppColors.blackShade,
                              fontSize: _titleSize,
                              height: 1.25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 5),
                          SvgPicture.asset(AppConstants.appLogoSvg),
                        ],
                      ),
                    ),
                  ],
                ),

                textAlign: TextAlign.center,
              ),
              Spacer(),

              const Align(alignment: Alignment.center, child: AuthTail()),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
