import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthTail extends StatelessWidget {
  const AuthTail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "stay_organized".tr(),
          style: TextStyle(
            color: AppColors.greyShade,
            fontSize: 15,
            height: 1.24,
          ),
        ),
        SizedBox(width: 5),
        SvgPicture.asset(AppConstants.appLogoWithNameSvg),
      ],
    );
  }
}
