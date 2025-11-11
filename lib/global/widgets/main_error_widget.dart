import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:appointments_app/global/theme/theme_x.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.error,
    this.onTryAgainTap,
    this.height = 0,
    this.isRefresh = false,
    this.messageColor,
    this.tryAgainColor,
  });

  final String error;
  final VoidCallback? onTryAgainTap;
  final Color? messageColor;
  final Color? tryAgainColor;
  final bool isRefresh;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height),
        Text(
          error,
          style: TextStyle(
            fontSize: 20,
            color: messageColor ?? context.cs.onTertiaryContainer,
          ),
          textAlign: TextAlign.center,
        ),
        if (onTryAgainTap != null)
          InkWell(
            onTap: onTryAgainTap,
            child: Text(
              isRefresh ? "refresh".tr() : "try_again".tr(),
              style: TextStyle(
                color: tryAgainColor ?? context.cs.onTertiaryContainer,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}
