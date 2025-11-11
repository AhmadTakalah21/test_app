import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appointments_app/global/utils/app_colors.dart';
import 'package:appointments_app/global/utils/constants.dart';

enum MainTextFieldStyle { outline, underline, none }

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.labelText,
    this.textInputType,
    this.textInputAction,
    this.hintText,
    this.inputFormatters,
    this.initialText,
    this.errorText,
    this.padding,
    this.contentPadding,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.textColor = AppColors.black,
    this.floatingLabelColor,
    this.hintStyle,
    this.borderRadius,
    this.borderColor = AppColors.mainColorSecondary,
    this.borderWidth = 1,
    this.outlineInputBorder,
    this.fillColor,
    this.filled = false,
    this.onClearTap,
    this.showCloseIcon,
    this.title,
    this.prefixIcon,
    this.hintColor,
    this.validator,
    this.maxLines,
    this.minLines = 1,
    this.titleSize = 15,
    this.titlePadding = AppConstants.padding0,
    this.titleHeight = 10,
    this.titleColor = AppColors.blackShade,
    this.style = MainTextFieldStyle.outline,
    this.isDense = true,
    this.enableInteractiveSelection = true,
    this.prefixIconMax = 20,
  });

  final String? hintText;
  final String? initialText;
  final String? title;
  final ValueSetter<String>? onChanged;
  final ValueSetter<String>? onSubmitted;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String? labelText;
  final bool readOnly;
  final bool obscureText;
  final bool? filled;
  final bool? showCloseIcon;
  final bool isDense;
  final bool enableInteractiveSelection;

  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Color textColor;
  final Color? floatingLabelColor;
  final Color borderColor;
  final double borderWidth;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final Color? hintColor;
  final BorderRadius? borderRadius;
  final InputBorder? outlineInputBorder;
  final MainTextFieldStyle style;
  final double prefixIconMax;

  final VoidCallback? onClearTap;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;

  // Title line
  final double titleSize;
  final EdgeInsets titlePadding;
  final double titleHeight;
  final Color titleColor;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late final bool _ownsController;
  late final TextEditingController _controller;
  late Color? _floatingLabelColor = widget.floatingLabelColor;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  InputBorder _buildEnabledBorder() {
    switch (widget.style) {
      case MainTextFieldStyle.none:
        return InputBorder.none;
      case MainTextFieldStyle.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
        );
      case MainTextFieldStyle.outline:
        return OutlineInputBorder(
          borderRadius: widget.borderRadius ?? AppConstants.borderRadius15,
          borderSide: BorderSide(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
        );
    }
  }

  InputBorder _buildFocusedBorder() {
    final focusedColor = widget.borderColor;
    switch (widget.style) {
      case MainTextFieldStyle.none:
        return InputBorder.none;
      case MainTextFieldStyle.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: focusedColor,
            width: widget.borderWidth + 0.2,
          ),
        );
      case MainTextFieldStyle.outline:
        return OutlineInputBorder(
          borderRadius: widget.borderRadius ?? AppConstants.borderRadius15,
          borderSide: BorderSide(
            color: focusedColor,
            width: widget.borderWidth + 0.2,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final suffix = widget.suffixIcon;
    final prefix = widget.prefixIcon;
    final showClose = widget.showCloseIcon ?? true;
    final title = widget.title;

    final EdgeInsets contentPadding =
        widget.contentPadding ?? widget.padding ?? AppConstants.padding8;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: widget.titlePadding,
            child: Text(
              title,
              style: TextStyle(
                fontSize: widget.titleSize,
                height: 1.24,
                color: widget.titleColor,
              ),
            ),
          ),
        TextFormField(
          controller: _controller,
          obscureText: widget.obscureText,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          onChanged: (text) {
            widget.onChanged?.call(text);
            setState(() {});
          },
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          onFieldSubmitted: widget.onSubmitted,
          focusNode: widget.focusNode,
          keyboardType: widget.textInputType ?? TextInputType.name,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          cursorColor: widget.textColor,
          style: TextStyle(color: widget.textColor),
          enableInteractiveSelection: widget.enableInteractiveSelection,
          decoration: InputDecoration(
            isDense: widget.isDense,
            contentPadding: contentPadding,
            labelText: widget.labelText,
            floatingLabelStyle: TextStyle(
              color: widget.errorText == null
                  ? _floatingLabelColor ?? AppColors.black
                  : AppColors.red,
            ),
            labelStyle: TextStyle(
              color: widget.errorText == null ? AppColors.grey : AppColors.red,
              fontSize: 14,
            ),
            //alignLabelWithHint: true,
            hintText: widget.hintText,
            hintStyle:
                widget.hintStyle ??
                TextStyle(
                  fontSize: 16,
                  color: widget.hintColor ?? AppColors.mainColorSecondary,
                ),
            errorStyle: const TextStyle(fontSize: 16, color: AppColors.red),
            errorText: widget.errorText,

            border: widget.outlineInputBorder ?? _buildEnabledBorder(),
            enabledBorder: widget.outlineInputBorder ?? _buildEnabledBorder(),
            focusedBorder: widget.outlineInputBorder ?? _buildFocusedBorder(),

            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (suffix != null) suffix,
                if (!widget.readOnly &&
                    _controller.text.isNotEmpty &&
                    showClose)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.greyShade3, width: 2),
                    ),
                    child: Padding(
                      padding: AppConstants.padding4,
                      child: InkWell(
                        onTap: () {
                          _controller.clear();
                          widget.onChanged?.call("");
                          widget.onClearTap?.call();
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.close,
                          color: AppColors.greyShade3,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                if (!widget.readOnly &&
                    _controller.text.isNotEmpty &&
                    showClose)
                  const SizedBox(width: 10),
              ],
            ),

            prefixIcon: prefix,
            prefixIconConstraints: BoxConstraints(
              maxWidth: widget.prefixIconMax,
              maxHeight: widget.prefixIconMax,
            ),

            fillColor: widget.fillColor ?? AppColors.mainColorSecondary,
            filled: widget.filled,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
