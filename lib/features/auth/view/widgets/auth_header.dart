import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.blackShade,
            letterSpacing: 0.35,
            fontSize: 22,
            height: 1.28,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Text(
              "start_journey".tr(),
              style: TextStyle(
                color: AppColors.greyShade,
                fontSize: 17,
                height: 1.22,
              ),
            ),
            SizedBox(width: 5),
            SvgPicture.asset(AppConstants.wavingHandSvg, width: 22, height: 22),
          ],
        ),
      ],
    );
  }
}
