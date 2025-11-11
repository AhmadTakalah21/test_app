import 'package:flutter/material.dart';
import 'package:appointments_app/global/theme/theme_x.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';
import 'package:appointments_app/global/widgets/loading_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainActionButton extends StatefulWidget {
  const MainActionButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.duration,
    this.buttonColor,
    this.isExpandText = false,
    this.width,
    this.border,
    this.height,
    this.fontSize,
    this.shadow,
    this.fontWeight,
    this.borderRadius,
    this.padding,
    this.child,
    this.icon,
    this.isLoading = false,
    this.margin,
    this.iconAsset,
    this.enabled = true,
  });

  final VoidCallback onPressed;
  final Duration? duration;
  final Color? buttonColor;
  final String text;
  final Color? textColor;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final double? fontSize;
  final List<BoxShadow>? shadow;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Icon? icon;
  final String? iconAsset;
  final bool isExpandText;
  final bool isLoading;
  final bool enabled;

  @override
  State<MainActionButton> createState() => _MainActionButtonState();
}

class _MainActionButtonState extends State<MainActionButton> {
  @override
  Widget build(BuildContext context) {
    final btnColor = widget.enabled
        ? (widget.buttonColor ?? context.cs.primary)
        : AppColors.mainColorSecondary;
    Widget textWidget = Text(
      widget.text,
      style: TextStyle(
        color: widget.textColor ?? AppColors.white,
        height: 1.21,
        fontSize: widget.fontSize ?? 15,
        fontWeight: widget.fontWeight ?? FontWeight.w500,
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
    final buildText = widget.isExpandText
        ? Expanded(child: textWidget)
        : textWidget;
    final icon = widget.icon;
    final iconAsset = widget.iconAsset;
    return InkWell(
      onTap: widget.isLoading || !widget.enabled ? null : widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: widget.margin,
        padding: widget.padding ?? AppConstants.padding16,
        decoration: BoxDecoration(
          border: widget.border,
          color: btnColor,
          borderRadius: widget.borderRadius ?? AppConstants.borderRadius16,
          boxShadow: widget.shadow,
        ),
        child: Center(
          child: widget.isLoading
              ? const LoadingIndicator(size: 25)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[icon, const SizedBox(width: 5)],
                    if (iconAsset != null) ...[
                      SvgPicture.asset(iconAsset),
                      const SizedBox(width: 5),
                    ],
                    widget.child ?? buildText,
                  ],
                ),
        ),
      ),
    );
  }
}
